//
//  MainScreenView.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject var viewModel: MainScreenViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel(recipeManager: RecipeManager()))
    }
}
