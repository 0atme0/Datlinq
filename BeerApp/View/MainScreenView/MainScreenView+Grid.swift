//
//  MainScreenView+Grid.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation
import SwiftUI

extension MainScreenView {
    var grid: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.recipesList, id: \.self) { item in
                            RecipeCellView(recipe: item)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
