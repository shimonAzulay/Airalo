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
  var body: some View {
    VStack(spacing: 10) {
      Picker("", selection: $selectedTab) {
        Text("Local eSIMs").tag(TopTab.local)
        Text("Regional eSIMs").tag(TopTab.regional)
        Text("Global eSIM").tag(TopTab.global)
      }
      .pickerStyle(.segmented)
      .font(Font.custom("IBMPlexSans-Medium", size: 13))
      .foregroundColor(Color("SegmentedTextColor"))
      .frame(width: 335)
      
      switch(selectedTab) {
      case .local: LocalAreaView()
      case .regional: RegionalAreaView()
      case .global: GlobalView()
      }
    }
  }
}
