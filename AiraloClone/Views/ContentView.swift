//
//  ContentView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      StoreView()
        .tabItem {
          Label("Store", systemImage: "house.fill")
        }
      
      Text("My eSIMs")
        .tabItem {
          Label("My eSIMs", systemImage: "esim")
        }
      
      Text("Profile")
        .tabItem {
          Label("Profile", systemImage: "person.crop.circle")
        }
    }
    .preferredColorScheme(.light)
    .onAppear {
      UITabBar.appearance().backgroundColor = .white
      if let titleFont = UIFont.plexSansSemiBold(size: 10) {
        UITabBarItem.appearance().setTitleTextAttributes([
          .font: titleFont], for: .normal)
      }
    }
  }
}
