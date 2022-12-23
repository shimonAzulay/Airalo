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
          .toolbar {
            VStack(spacing: 2) {
              HStack {
                Image("airmoney")
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
              .frame(width: 80, height: 25, alignment: .center)
              .overlay(
                RoundedRectangle(cornerRadius: 3)
                  .stroke(Color.normal, lineWidth: 1)
              )
            }
          }
      }
      .searchable(text: $searchText,
                  prompt: "Search data packs for +190 countries and regions")
      .font(Font.plexSansRegular(size: 13))
    }
  }
}
