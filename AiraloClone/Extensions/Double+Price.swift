//
//  Double+Price.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

extension Double {
  var removeTrailingZeros: String {
    if rounded() == self {
      return String(format: "%g", self)
    } else {
      return String(format: "%.2f", self)
    }
  }
}
