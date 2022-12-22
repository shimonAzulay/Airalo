//
//  StoreView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct StoreView: View {
  @State private var searchText = ""
  
  init() {
    if let titleColor = UIColor.normal,
       let titleFont = UIFont.plexSansSemiBold(size: 27) {
      UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: titleColor,
                                                               .font: titleFont]
    }
  }
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        TopTabView()
          .navigationTitle("Hello")
          .navigationBarTitleDisplayMode(.large)
      }
      .searchable(text: $searchText,
                  prompt: "Search data packs for +190 countries and regions")
      .font(Font.plexSansRegular(size: 13))
      .foregroundColor(Color.normal)
    }
  }
}