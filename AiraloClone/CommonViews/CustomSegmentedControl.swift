//
//  CustomSegmentedControl.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 23/12/2022.
//

import SwiftUI

struct CustomSegmentedControl: View {
  @Binding var preselectedIndex: Int
  var options: [String]
  let color = Color.selectedSegmented
  var body: some View {
    HStack(spacing: 0) {
      ForEach(options.indices, id:\.self) { index in
        ZStack {
          Rectangle()
            .fill(Color.white)
          Rectangle()
            .fill(color)
            .cornerRadius(5)
            .padding(2)
            .opacity(preselectedIndex == index ? 1 : 0.01)
            .frame(height: 28)
            .onTapGesture {
              withAnimation(.interactiveSpring()) {
                preselectedIndex = index
              }
            }
        }
        .overlay(
          Text(options[index])
            .foregroundColor(preselectedIndex == index ? Color.selectedSegmentedTextColor : Color.unselectedSegmentedTextColor)
            .font(Font.plexSansSemiBold(size: 13))
        )
      }
    }
    .frame(height: 44)
  }
}

struct CustomSegmentedControl_Previews: PreviewProvider {
  static var previews: some View {
    CustomSegmentedControl(preselectedIndex: .constant(0), options: ["One", "two", "three"])
  }
}
