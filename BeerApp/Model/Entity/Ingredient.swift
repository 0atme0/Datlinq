//
//  MissedIngredient.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

struct Ingredient: Codable {
    let amount: Float
    let unit: String
    let name: String
    let original: String
    let image: String
}
