//
//  ConsumeApp.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/3/24.
//

import SwiftUI

@main
struct ConsumeApp: App {
    var body: some Scene {
        WindowGroup {
            MealsListScreen(mealCategory: .dessert)
        }
    }
}
