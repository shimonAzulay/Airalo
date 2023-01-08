//
//  LoginButtonView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 05/01/2023.
//

import SwiftUI

struct LoginButtonView: View {
  @Binding var hideHeader: Bool
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      HStack(spacing: 2) {
        Image(systemName: "equal.circle")
          .resizable()
          .frame(width: 14, height: 14)
          .foregroundColor(Color.normal)
        Text("Airmoney")
          .font(Font.plexSansMedium(size: 13))
          .foregroundColor(Color.normal)
      }
      .isHidden(hideHeader)
      .frame(height: hideHeader ? 0 : nil)
      .clipped()
      Button(action: {}
             ,label: {
        HStack(alignment: .center, spacing: 0) {
          Text("LOG IN")
            .font(Font.plexSansSemiBold(size: 11))
            .foregroundColor(Color.normal)
          Spacer()
        }
      })
      .frame(width: 80, height: 26, alignment: .center)
      .overlay(alignment: .center) {
        RoundedRectangle(cornerRadius: 3)
          .stroke(Color.loginButtonBorder, lineWidth: 1)
      }
    }
  }
}

