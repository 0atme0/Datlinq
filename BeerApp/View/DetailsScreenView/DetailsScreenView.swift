//
//  DetailsScreenView.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct DetailsScreenView: View {
    @ObservedObject var viewModel: DetailsScreenViewModel
    
    var body: some View {
        VStack {
            header
            list
            Spacer()
        }
    }
}

struct DetailsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreenView(viewModel: DetailsScreenViewModel(recipe: Recipe(title: "Test", image: "Test", missedIngredients: [], usedIngredients: [])))
    }
}
