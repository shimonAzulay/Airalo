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
        VStack(spacing: 0) {
          HeaderView(title: package.name,
                     detail: package.countries.count > 1 ? HeaderView.Detail.countries(package.countries.count) : HeaderView.Detail.country(package.countries.first ?? ""))
          .modifier(Padding())
          
          Divider()
          
          DetailView(detail: "DATA", amount: package.dataAmount, icon: "arrow.up.arrow.down.circle")
            .modifier(Padding())
          
          Divider()
          
          DetailView(detail: "VALIDITY", amount: package.timeValidity, icon: "calendar")
            .modifier(Padding())
          
          Divider()
          
          ButtonView(price: package.price,
                     borderColor: package.style.toColor)
          .modifier(Padding())
        }
        .foregroundColor(package.style.toColor)
        .background(LinearGradient(colors: [Color(hex: package.colorStart),
                                            Color(hex: package.colorEnd)],
                                   startPoint: .leading,
                                   endPoint: .trailing))
        .modifier(ItemModifier())
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
          .modifier(ItemModifier())
          Spacer()
        }
        .padding(.trailing, 20)
      }
    }
    .frame(alignment: .leading)
  }
}

extension PackageItemView {
  struct HeaderView: View {
    enum Detail {
      case country(String)
      case countries(Int)
    }
    var title: String
    var detail: Detail
    
    var body: some View {
      HStack {
        VStack(alignment: .leading, spacing: 5.5) {
          Text(title)
            .font(Font.plexSansSemiBold(size: 19))
          switch detail {
          case .country(let country):
            Text(country)
              .font(Font.plexSansMedium(size: 13))
          case .countries(let countries):
            HStack(spacing: 5) {
              Text("\(countries) Countries")
                .font(Font.plexSansMedium(size: 13))
              Image(systemName: "arrow.right.circle.fill")
                .resizable()
                .frame(width: 12, height: 12)
            }
          }
        }
        Spacer()
      }
    }
  }
  
  struct DetailView: View {
    var detail: String
    var amount: String
    var icon: String
    
    init(detail: String, amount: String, icon: String) {
      self.detail = detail
      self.amount = amount
      self.icon = icon
    }
    
    var body: some View {
      HStack(spacing: 6) {
        Image(systemName: icon)
          .resizable()
          .frame(width: 22, height: 22)
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
        RoundedRectangle(cornerRadius: 5)
          .stroke(borderColor, lineWidth: 1)
      )
    }
  }
  
  struct Padding: ViewModifier {
    func body(content: Content) -> some View {
      content
        .padding(20)
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
