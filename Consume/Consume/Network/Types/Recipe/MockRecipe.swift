//
//  MockRecipe.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

struct MockRecipe: RecipeRepresentable {
    var id: String
    var name: String
    var instructions: String
    var ingredients: [Ingredient]
    var thumbnailURL: URL
}

extension MockRecipe {

    static let mockRecipe: MockRecipe = MockRecipe(
        id: "52898",
        name: "Chelsea Buns",
        instructions: """
        Sift the flour and salt into a large bowl. Make a well in the middle and add the yeast.
        Meanwhile, warm the milk and butter in a saucepan until the butter melts and the mixture is lukewarm.
        Add the milk mixture and egg to the flour mixture and stir until the contents of the bowl come together as a soft dough. (You may need to add a little extra flour.)
        Tip the dough onto a generously floured work surface. Knead for five minutes, adding more flour if necessary, until the dough is smooth and elastic and no longer feels sticky.
        Lightly oil a bowl with a little of the vegetable oil. Place the dough into the bowl and turn until it is covered in the oil. Cover the bowl with cling film and set aside in a warm place for one hour, or until the dough has doubled in size.
        Lightly grease a baking tray.
        For the filling, knock the dough back to its original size and turn out onto a lightly floured work surface. Roll the dough out into a rectangle 0.5cm/¼in thick. Brush all over with the melted butter, then sprinkle over the brown sugar, cinnamon and dried fruit.
        Roll the dough up into a tight cylinder , cut ten 4cm/1½in slice and place them onto a lightly greased baking sheet, leaving a little space between each slice. Cover with a tea towel and set aside to rise for 30 minutes.
        Preheat oven to 190C/375F/Gas 5.
        Bake the buns in the oven for 20-25 minutes, or until risen and golden-brown.
        Meanwhile, for the glaze, heat the milk and sugar in a saucepan until boiling. Reduce the heat and simmer for 2-3 minutes.
        Remove the buns from the oven and brush with the glaze, then set aside to cool on a wire rack.
        """,
        ingredients: [
            .init(ingredient: "White Flour", unit: "500 g"),
            .init(ingredient: "Salt", unit: "1 tsp")
        ],
        thumbnailURL: URL(string: "https://www.themealdb.com/images/media/meals/vqpwrv1511723001.jpg")!
    )

}
