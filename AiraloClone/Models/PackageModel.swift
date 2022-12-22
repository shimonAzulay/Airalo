//
//  PackageModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

struct PackageModel: Identifiable {
  let id = UUID()
  let image: String
  let name: String
  let countriesAvilabilty: Int
  let dataAmount: Int
  let timeValidity: Int
  let price: Int
}
