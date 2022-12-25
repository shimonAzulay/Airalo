//
//  RegionalAreaDetailViewModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

class RegionalAreaDetailViewModel: PackagesViewModel {
  override func fetchData(forAreaId id: Int?) async throws -> PackagesResponse? {
    guard let id else { return nil }
    return try await networkService.data(endpoint: AiraloEndpoint.regionPackages(id: id))
  }
}
