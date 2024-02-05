//
//  Ingredient.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

struct Ingredient: Hashable, Decodable, Identifiable {
    let ingredient: String
    let unit: String
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case ingredient
        case unit
    }
}
