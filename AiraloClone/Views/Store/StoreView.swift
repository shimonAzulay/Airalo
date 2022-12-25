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
  
  init() {
    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.configureWithOpaqueBackground()
    if let titleColor = UIColor.normal,
       let largeTitleFont = UIFont.plexSansSemiBold(size: 27),
       let inlineTitleFont = UIFont.plexSansMedium(size: 15) {
      navigationBarAppearance.titleTextAttributes = [.foregroundColor: titleColor,
                                                     .font: inlineTitleFont]
      navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor,
                                                          .font: largeTitleFont]
    }
    navigationBarAppearance.shadowColor = .clear
    navigationBarAppearance.backgroundColor = .white
    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
  }
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        StoreTopTabView()
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

struct LoginButtonView: View {
  @Binding var hideHeader: Bool
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      HStack(spacing: 2) {
        Image(systemName: "equal.circle")
          .resizable()
          .frame(width: 14, height: 14)
          .foregroundColor(Color.normal)
        Text("Airmoney")
          .font(Font.plexSansMedium(size: 13))
          .foregroundColor(Color.normal)
      }
      .isHidden(hideHeader)
      .frame(height: hideHeader ? 0 : nil)
      .clipped()
      Button(action: {}
             ,label: {
        HStack(alignment: .center, spacing: 0) {
          Text("LOG IN")
            .font(Font.plexSansSemiBold(size: 11))
            .foregroundColor(Color.normal)
          Spacer()
        }
      })
      .frame(width: 80, height: 26, alignment: .center)
      .overlay(alignment: .center) {
        RoundedRectangle(cornerRadius: 3)
          .stroke(Color.loginButtonBorder, lineWidth: 1)
      }
    }
  }
}
