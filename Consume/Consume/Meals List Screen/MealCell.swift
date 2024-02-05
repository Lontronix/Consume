//
//  MealCell.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import SwiftUI

struct MealCell: View {

    let mealName: String
    let mealURL: URL

    init(meal: MealPreviewRepresentable) {
        self.mealName = meal.name
        self.mealURL = meal.thumbnailURL
    }

    @ViewBuilder
    private func image() -> some View {
        AsyncImage(url: mealURL) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .clipShape(.rect(cornerRadius: UIConstants.imageCornerRadius))
        .frame(width: 50, height: 50)
    }

    var body: some View {
        HStack {
            image()
            VStack {
                Text(mealName)
            }
        }
    }

}
