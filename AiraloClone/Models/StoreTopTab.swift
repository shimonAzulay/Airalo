//
//  StoreTopTabModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 23/12/2022.
//

import Foundation

enum StoreTopTab: Identifiable {
  case local
  case regional
  case global
  
  var id: String {
    self.title
  }
  
  var title: String {
    switch self {
    case .local: return "Local eSIMs"
    case .global: return "Regional eSIMs"
    case .regional: return "Global eSIM"
    }
  }
}
