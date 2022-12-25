//
//  RegionalAreaViewModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

class RegionalAreaViewModel: AreaViewModel {
  override func fetchData() async throws -> [AreaResponse] {
    try await networkService.data(endpoint: AiraloEndpoint.regional)
  }
}
