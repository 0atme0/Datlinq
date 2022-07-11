//
//  MissedIngredient.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

struct Ingredient: Codable {
    let id = UUID()
    let amount: Float
    let unit: String
    let name: String
    let original: String
    let image: String
}

extension Ingredient: Hashable {
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
