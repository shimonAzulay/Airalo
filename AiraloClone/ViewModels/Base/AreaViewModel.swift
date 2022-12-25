//
//  AreaBaseViewModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 25/12/2022.
//

import Foundation

class AreaViewModel: ObservableObject  {
  @Published var areas = [AreaModel]()
  @Published var error: ViewModelError?
  
  let networkService: NetworkService
  
  init(networkService: NetworkService) {
    self.networkService = networkService
  }
  
  func fetch() {
    Task { @MainActor in
      do {
        let response: [AreaResponse] = try await fetchData()
        areas = response.compactMap { AreaModel(id: $0.id,
                                                name: $0.title,
                                                imageUrl: $0.imageUrl) }
      } catch {
        self.error = ViewModelError(errorMessage: "\(error)")
      }
    }
  }
  
  func fetchData() async throws -> [AreaResponse] { [] }
}
