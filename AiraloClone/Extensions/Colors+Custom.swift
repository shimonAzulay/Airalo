//
//  Colors+Custom.swift
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
