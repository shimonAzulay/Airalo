//
//  Colors+Custom.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import SwiftUI
import UIKit

enum AppColors {
  static let normal = "TextColor"
  static let Segmented = "SegmentedTextColor"
  static let packageLight = "PackageTextColor"
  
  static let areaItem = "ItemColor"
  static let shadow = "ItemShadowColor"
}

extension Color {
  static var normal: Color {
    Color(AppColors.normal)
  }
  
  static var segmented: Color {
    Color(AppColors.Segmented)
  }
  
  static var packageLight: Color {
    Color(AppColors.packageLight)
  }
  
  static var areaItem: Color {
    Color(AppColors.areaItem)
  }
  
  static var shadow: Color {
    Color(AppColors.shadow)
  }
}

extension UIColor {
  static var normal: UIColor? {
    UIColor(named: AppColors.normal)
  }
}
