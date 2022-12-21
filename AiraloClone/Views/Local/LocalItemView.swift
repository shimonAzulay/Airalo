//
//  LocalItemView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct LocalItemView: View {
  var image: String
  var description: String
  
  init(image: String, description: String) {
    self.image = image
    self.description = description
  }
  
  var body: some View {
    ListItemView(image: image, description: description)
  }
}
