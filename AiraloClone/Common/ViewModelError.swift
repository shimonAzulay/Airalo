//
//  ViewModelError.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import Foundation

struct ViewModelError: Identifiable {
  let id = UUID()
  let errorMessage: String
}
