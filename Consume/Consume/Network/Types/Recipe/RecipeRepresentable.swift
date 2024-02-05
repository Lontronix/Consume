//
//  RecipeRepresentable.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

protocol RecipeRepresentable {

    var id: String { get }
    var name: String { get }
    var instructions: String { get }
    var ingredients: [Ingredient] { get }
    var thumbnailURL: URL { get }

}
