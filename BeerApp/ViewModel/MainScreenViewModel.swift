//
//  MainScreenViewModel.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

class MainScreenViewModel: ObservableObject {
    private var recipeManager: RecipeManagerProtocol
    @Published var recipesList: [Recipe] = []
    @Published var isLoading = false
    @Published var isError: String?
    
    init(recipeManager: RecipeManagerProtocol) {
        self.recipeManager = recipeManager
        getRecipesList()
    }
    //MARK: - Private funcs
    private func getRecipesList() {
        self.isLoading = true
        self.recipeManager.getListOfRecipes() { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let list):
                    self.recipesList = list
                case .failure(let error):
                    self.isError = error.localizedDescription
                }
            }
        }
    }
    
}
