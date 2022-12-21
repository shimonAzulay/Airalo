//
//  ListView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct ListView<Header: View, ListItem: View, ListDetailedItem: View>: View {
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
  
  var spacing: CGFloat
  var header: Header?
  var item: ListItem
  var detailedItem: ListDetailedItem
  
  init(spacing: CGFloat,
       header: (() -> Header)? = nil,
       @ViewBuilder item: @escaping () -> ListItem,
       @ViewBuilder detailedItem: @escaping () -> ListDetailedItem) {
    self.spacing = spacing
    self.header = header?()
    self.item = item()
    self.detailedItem = detailedItem()
  }
  
  var body: some View {
    LazyVGrid(columns: [GridItem()], spacing: spacing) {
      if let header {
        header
      }
      
      ForEach(data) { article in
        NavigationLink(destination: {
          detailedItem
        }, label: {
          item
        })
        .buttonStyle(.plain)
      }
    }
  }
}
