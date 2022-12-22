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
  let dataAmount: String
  let timeValidity: String
  let price: String
  let colorStart: String
  let colorEnd: String
}
