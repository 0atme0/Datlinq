//
//  DetailsScreenView+List.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation
import SwiftUI

extension DetailsScreenView {
    var list: some View {
        ScrollView {
            VStack {
                usedList
                missedList
            }
        }
    }
    var usedList: some View {
        ForEach(viewModel.recipe.usedIngredients, id: \.self) { item in
            Divider()
            HStack {
                CachedAsyncImage(
                    url: URL(string: item.image),
                    urlCache: .imageCache,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .center)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .padding()
                VStack(alignment: .leading) {
                    Text(item.name.uppercased())
                        .bold()
                    Text("Description: " + item.original)
                }
                Spacer()
            }
        }
    }
    var missedList: some View {
        ForEach(viewModel.recipe.missedIngredients, id: \.self) { item in
            Divider()
            HStack {
                CachedAsyncImage(
                    url: URL(string: item.image),
                    urlCache: .imageCache,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .center)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .padding()
                VStack(alignment: .leading) {
                    Text(item.name.uppercased())
                        .bold()
                    Text("Description: " + item.original)
                }
                Spacer()
            }
        }
    }
}
