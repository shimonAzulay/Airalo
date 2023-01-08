//
//  StoreTopTabModel.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 23/12/2022.
//

import SwiftUI

enum StoreTopTab: TopTab {
  case local
  case regional
  case global
  
  var id: String {
    self.title
  }
  
  var title: String {
    switch self {
    case .local: return "Local eSIMs"
    case .global: return "Global eSIM"
    case .regional: return "Regional eSIMs"
    }
  }
  
  var view: AnyView {
    switch self {
    case .local:
      return AnyView(LocalAreaView(viewModel: LocalAreaViewModel(networkService: NetworkServiceFactory.shared)))
      
    case .regional:
      return AnyView(RegionalAreaView(viewModel: RegionalAreaViewModel(networkService: NetworkServiceFactory.shared)))
      
    case .global:
      return AnyView(GlobalView(viewModel: GlobalAreaViewModel(networkService: NetworkServiceFactory.shared)))
    }
  }
}
