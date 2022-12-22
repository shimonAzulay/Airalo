//
//  RegionalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct RegionalView: View {
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
    LazyVGrid(columns: [GridItem()], spacing: 10) {
      Text("Regions")
        .frame(width: 335, height: 55, alignment: .leading)
      
      ForEach(data) { article in
        NavigationLink(destination: {
          PackagesView()
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }, label: {
          LocalRegionItemView(image: "africa", description: "Africa")
        })
        .buttonStyle(.plain)
      }
    }
  }
}
