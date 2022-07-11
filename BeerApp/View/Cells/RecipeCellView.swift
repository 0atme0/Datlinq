//
//  RecipeCellView.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import SwiftUI

struct RecipeCellView: View {
    var recipe: Recipe
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: recipe.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                },
                placeholder: {
                    ProgressView()
                }
            )
            VStack {
                Spacer()
                Text(recipe.title)
                    .font(.subheadline)
            }
        }
    }
}

struct RecipeCellView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCellView(recipe: Recipe(title: "Test", image: "", missedIngredients: [], usedIngredients: []))
    }
}
