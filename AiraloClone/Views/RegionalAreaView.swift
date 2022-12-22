//
//  RegionalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct RegionalAreaView: View {
  let areas = [AreaModel(image: "africa", name: "Africa"),
               AreaModel(image: "africa", name: "Africa"),
               AreaModel(image: "africa", name: "Africa"),
               AreaModel(image: "africa", name: "Africa")]
  
  var body: some View {
    LazyVGrid(columns: [GridItem()], spacing: 10) {
      Text("Regions")
        .frame(width: 335, height: 55, alignment: .leading)
      
      ForEach(areas) { area in
        NavigationLink(destination: {
          PackagesView()
            .navigationTitle(area.name)
            .navigationBarTitleDisplayMode(.large)
        }, label: {
          AreaItemView(model: area)
        })
        .buttonStyle(.plain)
      }
    }
  }
}
