//
//  ResponseModels.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

struct AreaResponse: Decodable {
  let id: Int
  let title: String
  let imageUrl: URL
  
  enum OuterKeys: String, CodingKey {
    case id, title, image
  }
  
  enum ImageKeys: String, CodingKey {
    case url
  }
  
  init(from decoder: Decoder) throws {
    let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
    let imageContainer = try outerContainer.nestedContainer(keyedBy: ImageKeys.self,
                                                            forKey: .image)
    
    self.id = try outerContainer.decode(Int.self, forKey: .id)
    self.title = try outerContainer.decode(String.self, forKey: .title)
    self.imageUrl = try imageContainer.decode(URL.self, forKey: .url)
  }
}

struct PackagesResponse: Decodable {
  let packagesDetails: [PackageDetailResponse]
  
  enum OuterKeys: String, CodingKey {
    case packages
  }
  
  init(from decoder: Decoder) throws {
    let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
    self.packagesDetails = try outerContainer.decode([PackageDetailResponse].self, forKey: .packages)
  }
  
  struct PackageDetailResponse: Decodable {
    let title: String
    let data: String
    let validity: String
    let imageUrl: URL
    let price: Double
    let style: String
    let gradientStart: String
    let gradientEnd: String
    let countires: [Country]
    
    struct Country: Decodable {}
    
    enum OuterKeys: String, CodingKey {
      case data, validity, price, `operator`
    }
    
    enum OperatorKeys: String, CodingKey {
      case title, style, countries
      case imageUrl = "image"
      case gradientStart = "gradient_start"
      case gradientEnd = "gradient_end"
    }
    
    enum ImageKeys: String, CodingKey {
      case url
    }
    
    init(from decoder: Decoder) throws {
      let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
      
      self.data = try outerContainer.decode(String.self, forKey: .data)
      self.validity = try outerContainer.decode(String.self, forKey: .validity)
      self.price = try outerContainer.decode(Double.self, forKey: .price)
      
      let operatorContainer = try outerContainer.nestedContainer(keyedBy: OperatorKeys.self, forKey: .operator)
      self.title = try operatorContainer.decode(String.self, forKey: .title)
      self.style = try operatorContainer.decode(String.self, forKey: .style)
      
      let imageContainer = try operatorContainer.nestedContainer(keyedBy: ImageKeys.self, forKey: .imageUrl)
      self.imageUrl = try imageContainer.decode(URL.self, forKey: .url)
      self.gradientStart = try operatorContainer.decode(String.self, forKey: .gradientStart)
      self.gradientEnd = try operatorContainer.decode(String.self, forKey: .gradientEnd)
      self.countires = try operatorContainer.decode([Country].self, forKey: .countries)
    }
  }
}
