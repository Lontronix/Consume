//
//  MockMeal.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

struct MockMeal: MealPreviewRepresentable {
    var name: String
    var thumbnailURL: URL
    var id: String
}

extension MockMeal {
    static var mockMeals: [MockMeal] = [
        MockMeal(
            name: "Apam balik",
            thumbnailURL: .init(
                string: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"
            )!,
            id: "53049"
        ),
        MockMeal(
            name: "Chelsea Buns",
            thumbnailURL: .init(
                string: "https://www.themealdb.com/images/media/meals/vqpwrv1511723001.jpg"
            )!,
            id: "52898"
        )
    ]
}
