//
//  DetailsScreenViewModel.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

class DetailsScreenViewModel: ObservableObject {
    
    @Published var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}
