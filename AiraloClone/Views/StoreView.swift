//
//  StoreView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct StoreView: View {
  @State private var searchText = ""
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  init() {
    if let titleColor = UIColor(named: "TextColor"),
       let titleFont = UIFont(name: "IBMPlexSans-SemiBold", size: 27) {
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
      .font(Font.custom("IBMPlexSans-Regular", size: 13))
      .foregroundColor(Color("TextColor"))
    }
  }
}
