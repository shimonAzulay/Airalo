//
//  ListItemView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct ListItemView: View {
  var image: String
  var description: String
  
  init(image: String, description: String) {
    self.image = image
    self.description = description
  }
  
  var body: some View {
    HStack(alignment: .center, spacing: 20) {
      Image(image)
        .resizable()
        .frame(width: 37, height: 28)
      Text(description)
      Spacer()
      Image(systemName: "chevron.right")
        .resizable()
        .frame(width: 7, height: 12)
    }
    .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
    .frame(width: 335, alignment: .leading)
    .background(Color("ItemColor"))
    .cornerRadius(10)
    .shadow(color: Color("ItemShadowColor"),
            radius: 30,
            x: 0,
            y: 10)
  }
}
