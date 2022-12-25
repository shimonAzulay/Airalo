//
//  GlobalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct GlobalView: View {
  @StateObject var viewModel: GlobalAreaViewModel
  
  init(viewModel: GlobalAreaViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    PackagesView(packages: $viewModel.packages)
      .onAppear {
        viewModel.fetchPackages(forAreaId: nil)
      }
      .alert(item: $viewModel.error) { error in
        Alert(title: Text("Something Went Wrong"),
              message: Text(error.errorMessage),
              dismissButton: .cancel())
       }
  }
}
