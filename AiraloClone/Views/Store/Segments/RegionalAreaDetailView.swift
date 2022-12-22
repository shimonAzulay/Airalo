//
//  RegionalAreaDetailView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import SwiftUI

struct RegionalAreaDetailView: View {
  @StateObject var viewModel: RegionalAreaDetailViewModel
  var regionId: Int
      
  init(viewModel: RegionalAreaDetailViewModel,
       regionId: Int) {
    self._viewModel = StateObject(wrappedValue: viewModel)
    self.regionId = regionId
  }
  
  var body: some View {
    PackagesView(packages: $viewModel.packages)
      .onAppear {
        viewModel.fetchPackages(forRegionId: regionId)
      }
      .alert(item: $viewModel.error) { error in
        Alert(title: Text("Something Went Wrong"),
              message: Text(error.errorMessage),
              dismissButton: .cancel())
       }
  }
}
