//
//  CustomSegmentedControl.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 23/12/2022.
//

import SwiftUI

protocol TopTab: Identifiable {
  var title: String { get }
  var view: AnyView { get }
}

struct TopTabView: View {
  var tabs: [any TopTab]
  @State var selectedTabIndex: Int = 0
  
  var body: some View {
    VStack(spacing: 0) {
      ZStack {
        Rectangle()
          .frame(maxWidth: .infinity, idealHeight: 44)
          .shadow(color: Color.shadow,
                  radius: 30,
                  x: 0,
                  y: 10)
        VStack {
          SegmentedControlView(preselectedIndex: $selectedTabIndex,
                                 options: tabs.map { $0.title })
          .frame(height: 44)
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
      }
      
      VStack(spacing: 0) {
        tabs[selectedTabIndex].view
      }
      .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
  }
}

struct SegmentedControlView: View {
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
  }
}
