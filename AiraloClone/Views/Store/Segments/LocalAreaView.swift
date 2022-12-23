//
//  LocalView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 20/12/2022.
//

import SwiftUI

struct LocalAreaView: View {
  @StateObject var viewModel: LocalAreaViewModel
  
  init(viewModel: LocalAreaViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  var body: some View {
    AreaView(areas: $viewModel.areas, title: "Popular Countries") { countryId, shouldDismiss in
      LocalAreaDetailView(viewModel: LocalAreaDetailViewModel(networkService: viewModel.networkService), countryId: countryId, shouldDismiss: shouldDismiss)
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
