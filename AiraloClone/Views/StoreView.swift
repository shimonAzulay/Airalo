//
//  StoreView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct StoreView: View {
  @State private var searchText = ""
  var body: some View {
    NavigationStack {
      ScrollView(.vertical) {
        TopTabView()
          .navigationTitle("Hello")
      }
      .searchable(text: $searchText)
    }
  }
}
