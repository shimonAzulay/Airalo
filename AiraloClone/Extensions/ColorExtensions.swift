//
//  Color+Hex.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import SwiftUI
import UIKit

extension Color {
  static var normal: Color {
    Color("TextColor")
  }
  
  static var loginButtonBorder: Color {
    Color("LoginButtonBorderColor")
  }
  
  static var segmentedText: Color {
    Color("SegmentedTextColor")
  }
  
  static var selectedSegmented: Color {
    Color("SegmentedSelectedColor")
  }
  
  static var selectedSegmentedTextColor: Color {
    Color("SegementedSelectedTextColor")
  }
  
  static var unselectedSegmentedTextColor: Color {
    Color("SegmentedUnselectedTextColor")
  }
  
  static var packageLight: Color {
    Color("PackageTextLightColor")
  }
  
  static var packageDark: Color {
    Color("PackageTextDarkColor")
  }
  
  static var segmentBackgroundColor: Color {
    Color("SegmentContentBackgroundColor")
  }
  
  static var areaItem: Color {
    Color("ItemColor")
  }
  
  static var shadow: Color {
    Color("ItemShadowColor")
  }
}

extension UIColor {
  static var normal: UIColor? {
    UIColor(named: "TextColor")
  }
}


extension Color {
  init(hex: String) {
    let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&int)
    let a, r, g, b: UInt64
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (1, 1, 1, 0)
    }
    
    self.init(
      .sRGB,
      red: Double(r) / 255,
      green: Double(g) / 255,
      blue:  Double(b) / 255,
      opacity: Double(a) / 255
    )
  }
}
