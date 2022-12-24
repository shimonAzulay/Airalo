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
      do {
        let response: [AreaResponse] = try await networkService.data(endpoint: AiraloEndpoint.local)
        areas = response.compactMap { AreaModel(id: $0.id,
                                                name: $0.title,
                                                imageUrl: $0.imageUrl) }
      } catch {
        self.error = ViewModelError(errorMessage: "\(error)")
      }
    }
  }
}
