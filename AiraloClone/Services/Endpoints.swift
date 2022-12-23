//
//  Endpoints.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

protocol Endpoint {
  func makeRequest() -> URLRequest?
  func makeRequest<PAYLOAD: Encodable>(with payload: PAYLOAD) -> URLRequest?
}

enum HTTPMethod: String {
  case get = "GET"
}

enum AiraloEndpoint: Endpoint {
  case local
  case regional
  case global
  case countryPackages(id: Int)
  case regionPackages(id: Int)
  
  func makeRequest() -> URLRequest? {
    guard let url = URL(string: "https://\(host)\(uri)") else { return nil }
    
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod.rawValue
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("en", forHTTPHeaderField: "Accept-Language")

    return request
  }
  
  func makeRequest<PAYLOAD: Encodable>(with payload: PAYLOAD) -> URLRequest? {
    guard var request = makeRequest(),
          let jsonPayload = try? JSONEncoder().encode(payload) else { return nil }
    
    request.httpBody = jsonPayload
    return request
  }
  
  var host: String { "www.airalo.com/" }
  var uri: String { "\(service)\(resource)" }
  
  var service: String {
    switch self {
    case .local, .global, .regional, .countryPackages, .regionPackages:
      return "api/v2/"
    }
  }
  
  var resource: String {
    switch self {
    case .local:
      return "countries?type=popular"
    case .regional:
      return "regions"
    case .global:
      return "regions/world"
    case .countryPackages(let id):
      return "countries/\(id)"
    case .regionPackages(let id):
      return "regions/\(id)"
    }
  }
  
  var httpMethod: HTTPMethod {
    switch self {
    case .local, .global, .regional, .countryPackages, .regionPackages:
      return .get
    }
  }
}
