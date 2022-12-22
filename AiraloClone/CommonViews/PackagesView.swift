//
//  PackagesView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct PackagesView: View {
  let data = [Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain"),
              Model(title: "Spain")]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem()], spacing: 20) {
        ForEach(data) { article in
          PackageItemView()
        }
      }
    }
  }
}
