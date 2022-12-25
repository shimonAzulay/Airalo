//
//  PackagesViewModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 25/12/2022.
//

import Foundation

class PackagesViewModel: ObservableObject {
  @Published var packages = [PackageModel]()
  @Published var error: ViewModelError?
  
  let networkService: NetworkService
  
  init(networkService: NetworkService) {
    self.networkService = networkService
  }
  
  func fetchPackages(forAreaId id: Int?) {
    Task { @MainActor in
      do {
        guard let response: PackagesResponse = try await fetchData(forAreaId: id) else { return }
        
        packages = response.packagesDetails.compactMap { PackageModel(name: $0.title,
                                                                      imageUrl: $0.imageUrl,
                                                                      dataAmount: $0.data,
                                                                      timeValidity: $0.validity,
                                                                      price: "US$\($0.price.removeTrailingZeros)",
                                                                      style: $0.style.toAppStyle,
                                                                      colorStart: $0.gradientStart,
                                                                      colorEnd: $0.gradientEnd,
                                                                      countries: $0.countires.map({ country in country.title })) }
      } catch {
        self.error = ViewModelError(errorMessage: "\(error)")
      }
    }
  }
  
  func fetchData(forAreaId id: Int?) async throws -> PackagesResponse? { nil }
}


