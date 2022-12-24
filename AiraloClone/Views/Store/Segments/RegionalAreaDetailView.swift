//
//  RegionalAreaDetailView.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 22/12/2022.
//

import SwiftUI

struct RegionalAreaDetailView: View {
  @Environment(\.dismiss) var dismiss
  @Binding var shouldDismiss: Bool
  @StateObject var viewModel: RegionalAreaDetailViewModel
  var regionId: Int
  
  init(viewModel: RegionalAreaDetailViewModel,
       regionId: Int,
       shouldDismiss: Binding<Bool>) {
    self._viewModel = StateObject(wrappedValue: viewModel)
    self.regionId = regionId
    self._shouldDismiss = Binding(projectedValue: shouldDismiss)
  }
  
  var body: some View {
    ScrollView {
      VStack {
        PackagesView(packages: $viewModel.packages)
          .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
      }
      .frame(maxWidth: .infinity)
    }
    .background(Color.segmentBackgroundColor.ignoresSafeArea(.all, edges: .bottom))
    .onAppear {
      viewModel.fetchPackages(forRegionId: regionId)
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
