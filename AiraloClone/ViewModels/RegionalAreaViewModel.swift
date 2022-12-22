//
//  RegionalAreaViewModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

class RegionalAreaViewModel: ObservableObject {
  @Published var areas = [AreaModel]()
  @Published var error: ViewModelError?
  
  let networkService: NetworkService
  
  init(networkService: NetworkService) {
    self.networkService = networkService
  }
  
  func fetch() {
    Task { @MainActor in
      let response: [AreaResponse] = try await networkService.data(endpoint: AiraloEndpoint.regional)
      
      areas = response.compactMap { AreaModel(id: $0.id, name: $0.title, imageUrl: "spain") }
    }
  }
}
