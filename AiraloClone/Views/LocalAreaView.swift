//
//  LocalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct LocalAreaView: View {
  let data = [AreaModel(image: "spain", name: "Spain"),
              AreaModel(image: "spain", name: "Spain"),
              AreaModel(image: "spain", name: "Spain"),
              AreaModel(image: "spain", name: "Spain")]
  
  var body: some View {
    LazyVGrid(columns: [GridItem()], spacing: 10) {
      Text("Popular Countries")
        .font(Font.plexSansSemiBold(size: 19))
        .foregroundColor(Color.normal)
        .frame(width: 335, height: 55, alignment: .leading)
      
      ForEach(data) { area in
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
