//
//  LocalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct LocalView: View {
  var body: some View {
    ListView(spacing: 10, header: {
      Text("Popular Countries")
        .frame(width: 335, height: 55, alignment: .leading)
    },
             item: {
      LocalItemView(image: "spain", description: "Spain")
    },
             detailedItem: {
      PackagesView()
        .navigationTitle("Spain")
    })
  }
}

struct Model: Identifiable {
  let id = UUID()
  let title: String
}
