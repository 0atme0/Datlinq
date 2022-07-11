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
            AsyncImage(
                url: URL(string: viewModel.recipe.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(viewModel.recipe.title)
                .font(.title)
            ScrollView {
                ForEach(viewModel.recipe.usedIngredients, id: \.self) { item in
                    Divider()
                    HStack {
                        AsyncImage(
                            url: URL(string: item.image),
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
                ForEach(viewModel.recipe.missedIngredients, id: \.self) { item in
                    Divider()
                    HStack {
                        AsyncImage(
                            url: URL(string: item.image),
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
            Spacer()
        }
    }
}

struct DetailsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreenView(viewModel: DetailsScreenViewModel(recipe: Recipe(title: "Test", image: "Test", missedIngredients: [], usedIngredients: [])))
    }
}
