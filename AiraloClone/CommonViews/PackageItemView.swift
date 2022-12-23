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
          HeaderView(title: package.name,
                     countriesAvilabilty: package.countriesAvilabilty)
          .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
          
          Divider()
          
          DetailView(detail: "DATA", amount: package.dataAmount)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
          
          Divider()
          
          DetailView(detail: "VALIDITY", amount: package.timeValidity)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
          
          Divider()
          
          ButtonView(price: package.price,
                     borderColor: package.style.toColor)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        }
        .foregroundColor(package.style.toColor)
        .background(LinearGradient(colors: [Color(hex: package.colorStart),
                                            Color(hex: package.colorEnd)],
                                   startPoint: .leading,
                                   endPoint: .trailing))
        .cornerRadius(10)
        .shadow(color: Color.shadow,
                radius: 30,
                x: 0,
                y: 10)
      }
      
      HStack {
        Spacer()
        VStack() {
          CachedAsyncImageVIew(url: package.imageUrl) { image in
            image.resizable()
          } placeholder: {
            ProgressView()
          }
          .frame(width: 140, height: 88)
          .cornerRadius(10)
          .shadow(color: Color.shadow,
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
            .font(Font.plexSansSemiBold(size: 19))
          HStack(spacing: 5) {
            Text("\(countriesAvilabilty) Countries")
              .font(Font.plexSansMedium(size: 13))
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
          .font(Font.plexSansSemiBold(size: 11))
        Spacer()
        Text(amount)
          .font(Font.plexSansMedium(size: 17))
      }
    }
  }
  
  struct ButtonView: View {
    var price: String
    var borderColor: Color
    
    var body: some View {
      Button(action: {}
             ,label: {
        Text("\(price) - BUY NOW")
          .font(Font.plexSansSemiBold(size: 11))
      })
      .frame(width: 295, height: 44)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(borderColor, lineWidth: 1)
      )
    }
  }
}

extension PackageModel.Style {
  var toColor: Color {
    switch self {
    case .light: return Color.packageLight
    case .dark: return Color.packageDark
    }
  }
}
