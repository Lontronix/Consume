//
//  MealsListRequest.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

struct MealsListRequest: DataRequest {

    typealias Result = Meals

    let mealCategory: MealCategory

    init(category: MealCategory) {
        self.mealCategory = category
    }

    func constructRequestURL(withBaseURL baseURL: URL) -> URL {
        baseURL
            .appending(path: "filter.php")
            .appending(queryItems: [
                .init(name: "c", value: mealCategory.rawValue)
            ])
    }

}

extension MealsListRequest {

    struct Meals: Codable { 
        let meals: [Meal]
    }
    struct Meal: Codable, Identifiable, MealPreviewRepresentable {
        let name: String
        let thumbnailURL: URL
        let id: String

        enum CodingKeys: String, CodingKey {
            case name = "strMeal"
            case thumbnailURL = "strMealThumb"
            case id = "idMeal"
        }
    }

}

