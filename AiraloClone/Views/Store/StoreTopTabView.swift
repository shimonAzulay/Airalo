//
//  TopTabView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct StoreTopTabView: View {
  var tabs = [StoreTopTab.local, StoreTopTab.regional, StoreTopTab.global]
  @State var selectedTabIndex: Int = 0
  @State private var searchText = ""

  var body: some View {
    VStack {
      VStack {
        CustomSegmentedControl(preselectedIndex: $selectedTabIndex,
                               options: tabs.map { $0.title })
        .frame(width: 335)
      }
      .frame(maxWidth: .infinity)
      .background(Color.white)
      
      switch(tabs[selectedTabIndex]) {
      case .local: LocalAreaView(viewModel: LocalAreaViewModel(networkService: NetworkServiceFactory.shared))
        
      case .regional: RegionalAreaView(viewModel: RegionalAreaViewModel(networkService: NetworkServiceFactory.shared))
        
      case .global: GlobalView(viewModel: GlobalAreaViewModel(networkService: NetworkServiceFactory.shared))
      }
    }
    .searchable(text: $searchText,
                prompt: "Search data packs for +190 countries and regions")
    .font(Font.plexSansRegular(size: 13))
  }
}
