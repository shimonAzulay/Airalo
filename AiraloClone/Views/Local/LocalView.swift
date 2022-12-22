//
//  LocalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct LocalView: View {
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
      Text("Popular Countries")
        .font(Font.custom("IBMPlexSans-SemiBold", size: 19))
        .foregroundColor(Color("TextColor"))
        .frame(width: 335, height: 55, alignment: .leading)
      
      ForEach(data) { article in
        NavigationLink(destination: {
          PackagesView()
            .navigationTitle("Spain")
            .navigationBarTitleDisplayMode(.large)
        }, label: {
          LocalRegionItemView(image: "spain", description: "Spain")
        })
        .buttonStyle(.plain)
      }
    }
    .onAppear {
      Fonts.fonts()
    }
  }
}

struct Model: Identifiable {
  let id = UUID()
  let title: String
}

class Fonts {
  static func fonts() {
    for family in UIFont.familyNames {
      print(family)
      
      for names in UIFont.fontNames(forFamilyName: family){
        print("== \(names)")
      }
    }
  }
}
