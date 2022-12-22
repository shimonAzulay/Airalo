//
//  GlobalViewModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

class GlobalAreaViewModel: ObservableObject {
  @Published var packages = [PackageModel]()
  @Published var error: ViewModelError?
  
  let networkService: NetworkService
  
  init(networkService: NetworkService) {
    self.networkService = networkService
  }
  
  func fetch() {
    Task { @MainActor in
      do {
        let response: PackagesResponse = try await networkService.data(endpoint: AiraloEndpoint.global)
        
        packages = response.packagesDetails.compactMap { PackageModel(image: "spain",
                                                                      name: response.title,
                                                                      countriesAvilabilty: $0.countires.count,
                                                                      dataAmount: $0.data,
                                                                      timeValidity: $0.validity,
                                                                      price: "US$\($0.price.removeTrailingZeros)",
                                                                      colorStart: $0.gradientStart,
                                                                      colorEnd: $0.gradientEnd) }
      } catch {
        self.error = ViewModelError(errorMessage: "\(error)")
      }
    }
  }
}