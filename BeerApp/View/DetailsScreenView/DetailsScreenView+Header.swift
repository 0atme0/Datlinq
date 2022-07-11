//
//  DetailsScreenView+Header.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation
import SwiftUI

extension DetailsScreenView {
    var header: some View {
        VStack {
            CachedAsyncImage(
                url: URL(string: viewModel.recipe.image),
                urlCache: .imageCache,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(viewModel.recipe.title)
                .font(.title)
        }
    }
}
