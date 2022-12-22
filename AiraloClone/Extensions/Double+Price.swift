//
//  Double+Price.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

extension Double {
  var removeTrailingZeros: String {
    String(format: "%g", self)
  }
}
