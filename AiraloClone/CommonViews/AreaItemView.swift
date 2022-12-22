//
//  ListItemView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct AreaItemView: View {
  var model: AreaModel
  
  var body: some View {
    HStack(alignment: .center, spacing: 20) {
      Image(model.imageUrl)
        .resizable()
        .frame(width: 37, height: 28)
      Text(model.name)
        .font(Font.plexSansMedium(size: 15))
        .foregroundColor(Color.normal)
      Spacer()
      Image(systemName: "chevron.right")
        .resizable()
        .frame(width: 7, height: 12)
    }
    .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
    .frame(width: 335, alignment: .leading)
    .background(Color.areaItem)
    .cornerRadius(10)
    .shadow(color: Color.shadow,
            radius: 30,
            x: 0,
            y: 10)
  }
}
