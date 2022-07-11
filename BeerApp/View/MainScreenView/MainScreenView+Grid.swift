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
            } else
            if let error = viewModel.isError {
                VStack {
                    Spacer()
                    Text("Error: \(error.description)")
                        .font(.body)
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.recipesList, id: \.self) { item in
                            RecipeCellView(recipe: item)
                                .onTapGesture {
                                    self.showingDetails = true
                                }
                                .sheet(isPresented: $showingDetails) {
                                    DetailsScreenView(viewModel: DetailsScreenViewModel(recipe: item))
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}
