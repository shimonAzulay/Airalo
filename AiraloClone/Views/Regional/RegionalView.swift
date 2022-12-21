//
//  RegionalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct RegionalView: View {
  var body: some View {
    ListView(spacing: 10, header: {
      Text("Regions")
        .frame(width: 335, height: 55, alignment: .leading)
    },
             item: {
      RegionalItemView(image: "africa", description: "Africa")
    },
             detailedItem: {
      PackagesView()
        .navigationTitle("Africa")
    })
  }
}
