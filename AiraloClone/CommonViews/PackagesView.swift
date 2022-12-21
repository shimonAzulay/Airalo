//
//  PackagesView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct PackagesView: View {
  var body: some View {
    ScrollView {
      ListView<Text, PackageItemView, Text>(spacing: 20, item: {
        PackageItemView()
      }, detailedItem: {
        Text("Global")
      })
    }
  }
}
