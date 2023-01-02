//
//  ViewExtensions.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 25/12/2022.
//

import SwiftUI

extension View {
  @ViewBuilder
  func offset(coordinateSpace: String, offset: @escaping (CGFloat) -> Void) -> some View {
    self
      .overlay {
        GeometryReader { proxy in
          let minY = proxy.frame(in: .named(coordinateSpace)).minY
          
          Color.clear
            .preference(key: OffsetKey.self, value: minY)
            .onPreferenceChange(OffsetKey.self) { value in
              offset(value)
            }
        }
      }
  }
}

private struct OffsetKey: PreferenceKey {
  static var defaultValue: CGFloat = 0
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}

extension View {
  @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
    if hidden == false {
      self
    }
  }
}

