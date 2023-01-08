//
//  MySimTopTab.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 05/01/2023.
//

import SwiftUI

enum MySimTopTab: TopTab {
  case current
  case archived
  
  var id: String {
    self.title
  }
  
  var title: String {
    switch self {
    case .current: return "Current eSIMs"
    case .archived: return "Archived eSIMs"
    }
  }
  
  var view: AnyView {
    switch self {
    case .current:
      return AnyView(Text(""))
      
    case .archived:
      return AnyView(Text(""))
    }
  }
}
