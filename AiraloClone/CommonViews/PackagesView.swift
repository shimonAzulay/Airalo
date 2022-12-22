//
//  PackagesView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct PackagesView: View {
  let packages = [PackageModel(image: "spain",
                               name: "Discover Global",
                               countriesAvilabilty: 85,
                               dataAmount: 1,
                               timeValidity: 7,
                               price: 9),
                  PackageModel(image: "spain",
                               name: "Discover Global",
                               countriesAvilabilty: 85,
                               dataAmount: 3,
                               timeValidity: 15,
                               price: 24),
                  PackageModel(image: "spain",
                               name: "Discover Global",
                               countriesAvilabilty: 85,
                               dataAmount: 5,
                               timeValidity: 30,
                               price: 35)]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem()], spacing: 20) {
        ForEach(packages) { package in
          PackageItemView(package: package)
        }
      }
    }
  }
}
