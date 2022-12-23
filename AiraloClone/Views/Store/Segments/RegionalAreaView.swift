//
//  RegionalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 21/12/2022.
//

import SwiftUI

struct RegionalAreaView: View {
  @StateObject var viewModel: RegionalAreaViewModel
  
  init(viewModel: RegionalAreaViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    AreaView(areas: $viewModel.areas, title: "Regions") { regionId, shouldDismiss in
      RegionalAreaDetailView(viewModel: RegionalAreaDetailViewModel(networkService: viewModel.networkService),
                             regionId: regionId, shouldDismiss: shouldDismiss)
    }
    .onAppear {
      viewModel.fetch()
    }
    .alert(item: $viewModel.error) { error in
      Alert(title: Text("Something Went Wrong"),
            message: Text(error.errorMessage),
            dismissButton: .cancel())
     }
  }
}
