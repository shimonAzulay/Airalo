//
//  StoreView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct StoreView: View {
  private let scrollCoordinateSpace = "SCROLL"
  @State private var animateLogin = false
  @State private var searchText = ""
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        TopTabView(tabs: [StoreTopTab.local, StoreTopTab.regional, StoreTopTab.global])
          .navigationTitle("Hello")
          .navigationBarTitleDisplayMode(.large)
          .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
              LoginButtonView(hideHeader: $animateLogin)
            }
          }
          .offset(coordinateSpace: scrollCoordinateSpace) { offset in
            withAnimation(.easeOut(duration: 0.1)) {
              animateLogin = offset < 90
            }
          }
          .searchable(text: $searchText,
                      prompt: "Search data packs for +190 countries and regions")
          .font(Font.plexSansRegular(size: 13))
      }
      .background(Color.segmentBackgroundColor.ignoresSafeArea(.all, edges: [.bottom]))
    }
  }
}
