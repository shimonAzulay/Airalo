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
    HStack(alignment: .center) {
      CachedAsyncImageVIew(url: model.imageUrl) { image in
          image.resizable()
      } placeholder: {
          ProgressView()
      }
      .frame(width: 37, height: 28)
      Spacer()
        .frame(width: 20)
      Text(model.name)
        .lineLimit(1)
        .fixedSize(horizontal: true, vertical: false)
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
    .modifier(ItemModifier())
  }
}
