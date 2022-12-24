//
//  PackageModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

struct PackageModel: Identifiable {
  let id = UUID()
  let name: String
  let imageUrl: URL
  let dataAmount: String
  let timeValidity: String
  let price: String
  let style: Style
  let colorStart: String
  let colorEnd: String
  let countries: [String]
  
  enum Style {
    case light
    case dark
  }
}
