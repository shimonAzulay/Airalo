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
  
  var body: some View {
    VStack(spacing: 0) {
      ZStack {
        Rectangle()
          .frame(maxWidth: .infinity, idealHeight: 44)
          .shadow(color: Color.shadow,
                  radius: 30,
                  x: 0,
                  y: 10)
        VStack {
          CustomSegmentedControl(preselectedIndex: $selectedTabIndex,
                                 options: tabs.map { $0.title })
          .frame(height: 44)
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
      }
      
      VStack(spacing: 0) {
        switch(tabs[selectedTabIndex]) {
        case .local: LocalAreaView(viewModel: LocalAreaViewModel(networkService: NetworkServiceFactory.shared))
          
        case .regional: RegionalAreaView(viewModel: RegionalAreaViewModel(networkService: NetworkServiceFactory.shared))
          
        case .global: GlobalView(viewModel: GlobalAreaViewModel(networkService: NetworkServiceFactory.shared))
        }
      }
      .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
  }
}
