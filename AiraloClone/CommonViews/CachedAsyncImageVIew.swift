//
//  CachedAsyncImageVIew.swift
//  AiraloClone
//
//  Created by Shimon Azulay on 23/12/2022.
//

import SwiftUI
import CachedAsyncImage

struct CachedAsyncImageVIew<Content: View, Placeholder: View>: View {
  var url: URL?
  @ViewBuilder var content: (Image) -> Content
  @ViewBuilder var placeholder: () -> Placeholder
  
  var body: some View {
    CachedAsyncImage(url: url,
                     content: { image in
      content(image)
    },
                     placeholder: {
      placeholder()
    })
  }
}
