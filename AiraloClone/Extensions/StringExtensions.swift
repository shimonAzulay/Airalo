//
//  String+Style.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

extension String {
  var toAppStyle: PackageModel.Style {
    switch self {
    case "light": return .light
    case "dark": return .dark
    default: return .light
    }
  }
}
