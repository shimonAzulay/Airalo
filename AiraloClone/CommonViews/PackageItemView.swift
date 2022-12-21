//
//  PackageView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct PackageItemView: View {
  var body: some View {
    ZStack {
      VStack {
        Spacer()
          .frame(height: 20)
        VStack {
          InnerView {
            HeaderView()
          }
          
          Divider()
          
          InnerView {
            DetailView(detail: "DATA", amount: "1 GB")
          }
          
          Divider()
          
          InnerView {
            DetailView(detail: "VALIDITY", amount: "7 Days")
          }
          
          Divider()
          
          InnerView {
            ButtonView()
          }
        }
        .background(Gradient(colors: [Color.blue, Color.green]))
        .cornerRadius(10)
        .shadow(color: Color("ItemShadowColor"),
                radius: 30,
                x: 0,
                y: 10)
      }
      
      HStack {
        Spacer()
        VStack() {
          Image("spain")
            .resizable()
            .frame(width: 140, height: 88)
            .cornerRadius(10)
            .shadow(color: Color("ItemShadowColor"),
                    radius: 30,
                    x: 0,
                    y: 10)
          Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
      }
    }
    .frame(width: 335, alignment: .leading)
  }
}

extension PackageItemView {
  struct HeaderView: View {
    var body: some View {
      HStack {
        VStack(alignment: .leading, spacing: 5.5) {
          Text("Discover Global")
          HStack(spacing: 5) {
            Text("87 Countries")
            Text("Icon")
          }
        }
        
        Spacer()
      }
    }
  }
  
  struct DetailView: View {
    var detail: String
    var amount: String
    
    init(detail: String, amount: String) {
      self.detail = detail
      self.amount = amount
    }
    
    var body: some View {
      HStack(spacing: 6) {
        Text("Icon")
        Text(detail)
        Spacer()
        Text(amount)
      }
    }
  }
  
  struct ButtonView: View {
    var body: some View {
      Button("US$9 - BUY NOW") {}
        .frame(width: 295, height: 44)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(.white, lineWidth: 1)
        )
    }
  }
  
  struct InnerView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
      self.content = content()
    }
    
    var body: some View {
      content
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }
  }
}
