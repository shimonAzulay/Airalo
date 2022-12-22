//
//  Fonts+Custom.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import SwiftUI
import UIKit

enum PlexSansFonts {
  static let medium = "IBMPlexSans-Medium"
  static let regular = "IBMPlexSans-Regular"
  static let semiBold = "IBMPlexSans-SemiBold"
}

extension Font {
  static func plexSansMedium(size: CGFloat) -> Font {
    Font.custom(PlexSansFonts.medium, size: size)
  }
  
  static func plexSansRegular(size: CGFloat) -> Font {
    Font.custom(PlexSansFonts.regular, size: size)
  }
  
  static func plexSansSemiBold(size: CGFloat) -> Font {
    Font.custom(PlexSansFonts.semiBold, size: size)
  }
}

extension UIFont {
  static func plexSansSemiBold(size: CGFloat) -> UIFont? {
    UIFont(name: PlexSansFonts.semiBold, size: size)
  }
}
