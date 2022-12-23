//
//  TopTabView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

enum TopTab {
  case local
  case regional
  case global
}

struct TopTabView: View {
  @State private var selectedTab: TopTab = .local
  
  init() {
    if let titleColor = UIColor.segmented,
       let titleFont = UIFont.plexSansSemiBold(size: 13) {
      UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: titleColor,
                                                              .font: titleFont], for: .normal)
    }
  }
  
  var body: some View {
    VStack(spacing: 10) {
      Picker("", selection: $selectedTab) {
        Text("Local eSIMs").tag(TopTab.local)
        Text("Regional eSIMs").tag(TopTab.regional)
        Text("Global eSIM").tag(TopTab.global)
      }
      .pickerStyle(.segmented)
      .font(Font.plexSansMedium(size: 13))
      .foregroundColor(Color.segmented)
      .frame(width: 335)
      
      switch(selectedTab) {
      case .local: LocalAreaView(viewModel: LocalAreaViewModel(networkService: NetworkServiceFactory.shared))
        
      case .regional: RegionalAreaView(viewModel: RegionalAreaViewModel(networkService: NetworkServiceFactory.shared))
        
      case .global: GlobalView(viewModel: GlobalAreaViewModel(networkService: NetworkServiceFactory.shared))
      }
    }
  }
}
