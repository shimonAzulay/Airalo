//
//  MySimView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 05/01/2023.
//

import SwiftUI

struct MySimView: View {
  private let scrollCoordinateSpace = "SCROLL"
  @State private var animateLogin = false
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        TopTabView(tabs: [MySimTopTab.current, MySimTopTab.archived])
          .navigationTitle("My eSIMs")
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
      }
      .background(Color.segmentBackgroundColor.ignoresSafeArea(.all, edges: [.bottom]))
    }
  }
}
