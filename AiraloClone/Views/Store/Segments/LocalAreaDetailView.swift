//
//  LocalAreaDetailView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import SwiftUI

struct LocalAreaDetailView: View {
  @Environment(\.dismiss) var dismiss
  @Binding var shouldDismiss: Bool
  @StateObject var viewModel: LocalAreaDetailViewModel
  var countryId: Int
      
  init(viewModel: LocalAreaDetailViewModel,
       countryId: Int,
       shouldDismiss: Binding<Bool>) {
    self._viewModel = StateObject(wrappedValue: viewModel)
    self.countryId = countryId
    self._shouldDismiss = Binding(projectedValue: shouldDismiss)
  }
  
  var body: some View {
    PackagesView(packages: $viewModel.packages)
      .onAppear {
        viewModel.fetchPackages(forCountryId: countryId)
      }
      .onChange(of: shouldDismiss) { newValue in
        if newValue {
          dismiss()
        }
      }
      .alert(item: $viewModel.error) { error in
        Alert(title: Text("Something Went Wrong"),
              message: Text(error.errorMessage),
              dismissButton: .cancel())
       }
  }
}
