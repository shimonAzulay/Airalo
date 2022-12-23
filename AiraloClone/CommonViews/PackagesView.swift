//
//  PackagesView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct PackagesView: View {
  @Binding var packages: [PackageModel]
  
  var body: some View {
    LazyVGrid(columns: [GridItem()], spacing: 20) {
      Spacer()
        .frame(height: 5)
      ForEach(packages) { package in
        PackageItemView(package: package)
      }
    }
    .toolbar(.hidden, for: .tabBar)
  }
}
