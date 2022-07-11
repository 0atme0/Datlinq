//
//  Recipe.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

struct Recipe: Codable {
    let id = UUID()
    let title: String
    let image: String
    let missedIngredients: [Ingredient]
    let usedIngredients: [Ingredient]
}

extension Recipe: Hashable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
