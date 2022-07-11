//
//  MainScreenView.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject var viewModel: MainScreenViewModel
    @State var showingDetails = false
    internal let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        VStack {
            title
            grid
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel(recipeManager: RecipeManager()))
    }
}
