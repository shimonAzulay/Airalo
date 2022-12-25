//
//  GlobalViewModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

class GlobalAreaViewModel: PackagesViewModel {
  override func fetchData(forAreaId id: Int?) async throws -> PackagesResponse? {
    try await networkService.data(endpoint: AiraloEndpoint.global)
  }
}
