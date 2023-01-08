//
//  ContentView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct ContentView: View {
  
  init() {
    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.configureWithOpaqueBackground()
    if let titleColor = UIColor.normal,
       let largeTitleFont = UIFont.plexSansSemiBold(size: 27),
       let inlineTitleFont = UIFont.plexSansMedium(size: 15) {
      navigationBarAppearance.titleTextAttributes = [.foregroundColor: titleColor,
                                                     .font: inlineTitleFont]
      navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor,
                                                          .font: largeTitleFont]
    }
    navigationBarAppearance.shadowColor = .clear
    navigationBarAppearance.backgroundColor = .white
    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
  }
  
  var body: some View {
    TabView {
      StoreView()
        .tabItem {
          Label("Store", systemImage: "house.fill")
        }
      
      MySimView()
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
