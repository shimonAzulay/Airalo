//
//  PackageView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct PackageItemView: View {
  var package: PackageModel
  
  var body: some View {
    ZStack {
      VStack {
        Spacer()
          .frame(height: 20)
        VStack {
          InnerView {
            HeaderView(title: package.name,
                       countriesAvilabilty: package.countriesAvilabilty)
          }
          
          Divider()
          
          InnerView {
            DetailView(detail: "DATA", amount: "\(package.dataAmount) GB")
          }
          
          Divider()
          
          InnerView {
            DetailView(detail: "VALIDITY", amount: "\(package.timeValidity) Days")
          }
          
          Divider()
          
          InnerView {
            ButtonView(price: package.price)
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
          Image(package.image)
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
    var title: String
    var countriesAvilabilty: Int
    
    var body: some View {
      HStack {
        VStack(alignment: .leading, spacing: 5.5) {
          Text(title)
            .font(Font.custom("IBMPlexSans-SemiBold", size: 19))
            .foregroundColor(Color("PackageTextColor"))
          HStack(spacing: 5) {
            Text("\(countriesAvilabilty) Countries")
              .font(Font.custom("IBMPlexSans-Medium", size: 13))
              .foregroundColor(Color("PackageTextColor"))
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
          .font(Font.custom("IBMPlexSans-SemiBold", size: 11))
          .foregroundColor(Color("PackageTextColor"))
        Spacer()
        Text(amount)
          .font(Font.custom("IBMPlexSans-Medium", size: 17))
          .foregroundColor(Color("PackageTextColor"))
      }
    }
  }
  
  struct ButtonView: View {
    var price: Int
    
    var body: some View {
      Button(action: {}
             ,label: {
        Text("US$\(price) - BUY NOW")
          .font(Font.custom("IBMPlexSans-SemiBold", size: 11))
          .foregroundColor(Color("PackageTextColor"))
      })
        .frame(width: 295, height: 44)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color("PackageTextColor"), lineWidth: 1)
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
