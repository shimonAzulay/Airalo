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
          Label("Store", systemImage: "list.dash")
        }
      
      Text("My eSIMs")
        .tabItem {
          Label("My eSIMs", systemImage: "square.and.pencil")
        }
      
      Text("Profile")
        .tabItem {
          Label("Profile", systemImage: "square.and.pencil")
        }
    }
  }
}
