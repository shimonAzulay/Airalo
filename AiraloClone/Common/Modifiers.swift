//
//  Modifiers.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 23/12/2022.
//

import SwiftUI

struct ItemModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .cornerRadius(10)
      .shadow(color: Color.shadow,
              radius: 30,
              x: 0,
              y: 10)
  }
}
