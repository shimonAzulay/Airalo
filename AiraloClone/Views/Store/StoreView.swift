//
//  StoreView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct StoreView: View {
  @State private var searchText = ""
  let tabs = [StoreTopTab.local, StoreTopTab.regional, StoreTopTab.global]
  
  init() {
    UINavigationBar.appearance().backgroundColor = .white
    if let titleColor = UIColor.normal,
       let titleFont = UIFont.plexSansSemiBold(size: 27) {
      UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: titleColor]
      UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: titleColor,
                                                   
                                                               .font: titleFont]
    }
  }
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        StoreTopTabView()
          .navigationTitle("Hello")
          .navigationBarTitleDisplayMode(.large)
          .toolbar {
            VStack(alignment: .center, spacing: 2) {
              HStack(spacing: 2) {
                Image(systemName: "equal.circle")
                  .resizable()
                  .frame(width: 16, height: 16)
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
              .frame(width: 80, height: 28, alignment: .center)
              .overlay(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(Color.loginButtonBorder, lineWidth: 1)
              )
            }
          }
      }
      .background(Color.segmentBackgroundColor.ignoresSafeArea(.all, edges: .bottom))
      .searchable(text: $searchText,
                  prompt: "Search data packs for +190 countries and regions")
      .font(Font.plexSansRegular(size: 13))
    }
  }
}
