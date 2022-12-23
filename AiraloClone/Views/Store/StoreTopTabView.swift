//
//  TopTabView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct StoreTopTabView: View {
  var tabs = [StoreTopTab.local, StoreTopTab.regional, StoreTopTab.global]
  @State var selectedTab: StoreTopTab = .local
  
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
        ForEach(tabs) { tab in
          Text(tab.title).tag(tab)
        }
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
