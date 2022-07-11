//
//  Recipe.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

struct Recipe: Codable {
    let title: String
    let image: String
    let missedIngredients: [Ingredient]
    let usedIngredients: [Ingredient]
}
