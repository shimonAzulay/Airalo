//
//  LocalAreaDetailView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import SwiftUI

struct LocalAreaDetailView: View {
  @StateObject var viewModel: LocalAreaDetailViewModel
  var countryId: Int
      
  init(viewModel: LocalAreaDetailViewModel,
       countryId: Int) {
    self._viewModel = StateObject(wrappedValue: viewModel)
    self.countryId = countryId
  }
  
  var body: some View {
    PackagesView(packages: $viewModel.packages)
      .onAppear {
        viewModel.fetchPackages(forCountryId: countryId)
      }
      .alert(item: $viewModel.error) { error in
        Alert(title: Text("Something Went Wrong"),
              message: Text(error.errorMessage),
              dismissButton: .cancel())
       }
  }
}
