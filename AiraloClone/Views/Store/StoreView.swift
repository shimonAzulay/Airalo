//
//  StoreView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct StoreView: View {  
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
              LoginButtonView()
            }
          }
      }
      .background(Color.segmentBackgroundColor.ignoresSafeArea(.all, edges: .bottom))
    }
  }
}

struct LoginButtonView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 2) {
      HStack(spacing: 2) {
        Image(systemName: "equal.circle")
          .resizable()
          .frame(width: 14, height: 14)
          .foregroundColor(Color.normal)
        Text("Airmoney")
          .font(Font.plexSansMedium(size: 13))
          .foregroundColor(Color.normal)
      }
      Button(action: {}
             ,label: {
        Text("LOG IN")
          .font(Font.plexSansSemiBold(size: 11))
          .foregroundColor(Color.normal)
      })
      .frame(width: 70, height: 20, alignment: .center)
      .overlay(
        RoundedRectangle(cornerRadius: 5)
          .stroke(Color.loginButtonBorder, lineWidth: 1)
      )
    }
  }
}
