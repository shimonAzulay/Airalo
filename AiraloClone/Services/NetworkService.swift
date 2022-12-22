//
//  NetworkService.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation
import Combine

enum NetworkServiceFactory {
  static let shared: NetworkService = AiraloNetworkService()
}

enum NetworkServiceError: Error, CustomStringConvertible {
  case invalidEndpoint
  case invalidResponse
  case badResponse
  case unauthenticated
  case general
  
  var description: String {
    switch self {
    case .invalidEndpoint:
      return "Invalid endpoint"
    case .invalidResponse, .badResponse:
      return "Invalid response"
    case .unauthenticated:
      return "Unauthenticated"
    case .general:
      return "Unknown"
    }
  }
}

protocol NetworkService {
  func data<PAYLOAD: Encodable, RESPONSE: Decodable>(endpoint: Endpoint, payload: PAYLOAD) async throws -> RESPONSE
  func data<RESPONSE: Decodable>(endpoint: Endpoint) async throws -> RESPONSE
}

class AiraloNetworkService: NetworkService {
  func data<PAYLOAD: Encodable, RESPONSE: Decodable>(endpoint: Endpoint, payload: PAYLOAD) async throws -> RESPONSE {
    guard let request = endpoint.makeRequest(with: payload) else {
      throw NetworkServiceError.invalidEndpoint
    }
    
    return try await data(request: request)
  }
  
  func data<RESPONSE: Decodable>(endpoint: Endpoint) async throws -> RESPONSE {
    guard let request = endpoint.makeRequest() else {
      throw NetworkServiceError.invalidEndpoint
    }
    
    return try await data(request: request)
  }
  
  private func data<RESPONSE: Decodable>(request: URLRequest) async throws -> RESPONSE {
    let (data, response) = try await URLSession.shared.data(for: request)
    guard let httpResponse = response as? HTTPURLResponse,
          200..<300 ~= httpResponse.statusCode else {
      throw NetworkServiceError.badResponse
    }
    
    do {
      return try JSONDecoder().decode(RESPONSE.self, from: data)
    } catch {
      print("Decoding error: \(error)")
      throw NetworkServiceError.invalidResponse
    }
  }
}

