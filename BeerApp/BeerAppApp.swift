//
//  BeerAppApp.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

@main
struct BeerAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreenView(viewModel: MainScreenViewModel(recipeManager: RecipeManager(resultsNumber: Constant.resultsNumber, mainIngredient: Constant.mainIngredient, networkManager: NetworkManager())))
        }
    }
}
