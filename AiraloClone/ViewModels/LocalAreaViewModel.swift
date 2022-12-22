//
//  LocalAreaViewModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

class LocalAreaViewModel: ObservableObject {
  @Published var areas = [AreaModel]()
  @Published var packages = [PackageModel]()
  @Published var error: ViewModelError?
  
  let networkService: NetworkService
  
  init(networkService: NetworkService) {
    self.networkService = networkService
  }
  
  func fetch() {
    Task { @MainActor in
      let response: [AreaResponse] = try await networkService.data(endpoint: AiraloEndpoint.local)
      
      areas = response.compactMap { AreaModel(id: $0.id,
                                              name: $0.title,
                                              imageUrl: $0.imageUrl) }
    }
  }
  
  func fetchPackages(forCountryId id: Int) {
    Task { @MainActor in
      do {
        let response: PackagesResponse = try await networkService.data(endpoint: AiraloEndpoint.countryPackages(id: id))
        
        packages = response.packagesDetails.compactMap { PackageModel(name: $0.title,
                                                                      imageUrl: $0.imageUrl,
                                                                      countriesAvilabilty: $0.countires.count,
                                                                      dataAmount: $0.data,
                                                                      timeValidity: $0.validity,
                                                                      price: "US$\($0.price.removeTrailingZeros)",
                                                                      style: $0.style.toAppStyle,
                                                                      colorStart: $0.gradientStart,
                                                                      colorEnd: $0.gradientEnd) }
      } catch {
        self.error = ViewModelError(errorMessage: "\(error)")
      }
    }
  }
}
