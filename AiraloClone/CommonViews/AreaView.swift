//
//  AreaView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import SwiftUI

struct AreaView<DetailView: View>: View {
  @Binding var areas: [AreaModel]
  var title: String
  @ViewBuilder var detailViewBuilder: (Int) -> DetailView
  
  init(areas: Binding<[AreaModel]>,
       title: String,
       @ViewBuilder detailViewBuilder: @escaping (Int) -> DetailView) {
    self._areas = areas
    self.title = title
    self.detailViewBuilder = detailViewBuilder
  }
  
  var body: some View {
    LazyVGrid(columns: [GridItem()], spacing: 10) {
      if areas.isEmpty == false {
        Text(title)
          .font(Font.plexSansSemiBold(size: 19))
          .foregroundColor(Color.normal)
          .frame(width: 335, height: 55, alignment: .leading)
      }
      
      ForEach(areas) { area in
        NavigationLink(destination: {
          detailViewBuilder(area.id)
            .navigationTitle(area.name)
            .navigationBarTitleDisplayMode(.large)
        }, label: {
          AreaItemView(model: area)
        })
        .buttonStyle(.plain)
      }
    }
    .padding(EdgeInsets(top: 5, leading: 0, bottom: 25, trailing: 0))
  }
}
