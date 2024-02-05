//
//  RecipeRequest.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

struct RecipeRequest: DataRequest {

    typealias Result = Meals

    let mealID: String

    func constructRequestURL(withBaseURL baseURL: URL) -> URL {
        baseURL
            .appending(path: "lookup.php")
            .appending(queryItems: [
                .init(name: "i", value: mealID)
            ])
    }

}

extension RecipeRequest {

    struct Meals: Decodable {
        let meals: [Recipe]
    }

    struct Recipe: Decodable, Identifiable, RecipeRepresentable {

        var id: String
        var name: String
        var instructions: String
        var ingredients: [Ingredient]
        var thumbnailURL: URL

        enum CodingKeys: String, CodingKey {
            case id = "idMeal"
            case name = "strMeal"
            case instructions = "strInstructions"
            case thumbnailURL = "strMealThumb"

            case strIngredient1
            case strIngredient2
            case strIngredient3
            case strIngredient4
            case strIngredient5
            case strIngredient6
            case strIngredient7
            case strIngredient8
            case strIngredient9
            case strIngredient10
            case strIngredient11
            case strIngredient12
            case strIngredient13
            case strIngredient14
            case strIngredient15
            case strIngredient16
            case strIngredient17
            case strIngredient18
            case strIngredient19
            case strIngredient20

            case strMeasure1
            case strMeasure2
            case strMeasure3
            case strMeasure4
            case strMeasure5
            case strMeasure6
            case strMeasure7
            case strMeasure8
            case strMeasure9
            case strMeasure10
            case strMeasure11
            case strMeasure12
            case strMeasure13
            case strMeasure14
            case strMeasure15
            case strMeasure16
            case strMeasure17
            case strMeasure18
            case strMeasure19
            case strMeasure20

        }

        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<RecipeRequest.Recipe.CodingKeys> = try decoder.container(
                keyedBy: RecipeRequest.Recipe.CodingKeys.self
            )
            self.id = try container.decode(String.self, forKey: CodingKeys.id)
            self.name = try container.decode(String.self, forKey: CodingKeys.name)
            self.instructions = try container.decode(String.self, forKey: CodingKeys.instructions)
            self.thumbnailURL = try container.decode(URL.self, forKey: .thumbnailURL)

            /*
             I'm not in love with this implementation but I wasn't sure how I could iterate over
             strIngredient1-20 and strMeasure1-20 while also using Codable.

             My goal is to re-arrange the way the data is represented so it is easier to deal with this data
             when it is being displayed in a view.

             If this were production code, I might speak with the backend team (if I could contact them)
             and see if it would be possible to get this data listed in a more convient way for how it is
             being displayed in the app.
             */
            var ingredients: [Ingredient] = []

            let ingredient1 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient1)
            let measurement1 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure1)
            if let ingredient1, !ingredient1.isEmpty, let measurement1, !measurement1.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient1, unit: measurement1))
            }

            let ingredient2 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient2)
            let measurement2 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure2)
            if let ingredient2, !ingredient2.isEmpty, let measurement2, !measurement2.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient2, unit: measurement2))
            }

            let ingredient3 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient3)
            let measurement3 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure3)
            if let ingredient3, !ingredient3.isEmpty, let measurement3, !measurement3.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient3, unit: measurement3))
            }

            let ingredient4 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient4)
            let measurement4 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure4)
            if let ingredient4, !ingredient4.isEmpty, let measurement4, !measurement4.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient4, unit: measurement4))
            }

            let ingredient5 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient5)
            let measurement5 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure5)
            if let ingredient5, !ingredient5.isEmpty, let measurement5, !measurement5.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient5, unit: measurement5))
            }

            let ingredient6 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient6)
            let measurement6 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure6)
            if let ingredient6, !ingredient6.isEmpty, let measurement6, !measurement6.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient6, unit: measurement6))
            }

            let ingredient7 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient7)
            let measurement7 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure7)
            if let ingredient7, !ingredient7.isEmpty, let measurement7, !measurement7.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient7, unit: measurement7))
            }

            let ingredient8 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient8)
            let measurement8 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure8)
            if let ingredient8, !ingredient8.isEmpty, let measurement8, !measurement8.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient8, unit: measurement8))
            }

            let ingredient9 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient9)
            let measurement9 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure9)
            if let ingredient9, !ingredient9.isEmpty, let measurement9, !measurement9.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient9, unit: measurement9))
            }

            let ingredient10 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient10)
            let measurement10 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure10)
            if let ingredient10, !ingredient10.isEmpty, let measurement10, !measurement10.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient10, unit: measurement10))
            }

            let ingredient11 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient11)
            let measurement11 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure11)
            if let ingredient11, !ingredient11.isEmpty, let measurement11, !measurement11.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient11, unit: measurement11))
            }

            let ingredient12 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient12)
            let measurement12 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure12)
            if let ingredient12, !ingredient12.isEmpty, let measurement12, !measurement12.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient12, unit: measurement12))
            }

            let ingredient13 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient13)
            let measurement13 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure13)
            if let ingredient13, !ingredient13.isEmpty, let measurement13, !measurement13.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient13, unit: measurement13))
            }

            let ingredient15 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient15)
            let measurement15 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure15)
            if let ingredient15, !ingredient15.isEmpty, let measurement15, !measurement15.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient15, unit: measurement15))
            }

            let ingredient16 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient16)
            let measurement16 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure16)
            if let ingredient16, !ingredient16.isEmpty, let measurement16, !measurement16.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient16, unit: measurement16))
            }

            let ingredient17 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient17)
            let measurement17 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure17)
            if let ingredient17, !ingredient17.isEmpty, let measurement17, !measurement17.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient17, unit: measurement17))
            }

            let ingredient18 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient18)
            let measurement18 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure18)
            if let ingredient18, !ingredient18.isEmpty, let measurement18, !measurement18.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient18, unit: measurement18))
            }

            let ingredient19 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient19)
            let measurement19 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure19)
            if let ingredient19, !ingredient19.isEmpty, let measurement19, !measurement19.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient19, unit: measurement19))
            }

            let ingredient20 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strIngredient20)
            let measurement20 = try container.decodeIfPresent(String.self, forKey: CodingKeys.strMeasure20)
            if let ingredient20, !ingredient20.isEmpty, let measurement20, !measurement20.isEmpty {
                ingredients.append(Ingredient(ingredient: ingredient20, unit: measurement20))
            }

            self.ingredients = ingredients
        }
    }

}
