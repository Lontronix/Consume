//
//  MealCategory.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

enum MealCategory: String {

    var navigationTitle: String {
        switch self {
            case .dessert:
                return "Desserts"
        }
    }

    case dessert = "Dessert"
}
