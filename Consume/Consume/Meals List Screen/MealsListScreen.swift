//
//  MealsListScreen.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation
import SwiftUI
import Observation

enum MealsListNavigationItem: Hashable {
    case mealDetail(mealD: String)
}

@Observable
class MealsListViewModel {

    let category: MealCategory
    let isMockData: Bool

    var loadState: LoadingState<[any MealPreviewRepresentable]> = .loadingItems

    init(category: MealCategory, isMockData: Bool) {
        self.category = category
        self.isMockData = isMockData
    }

    func fetchMeals() {
        Task {
            if isMockData {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.loadState = .loaded(items: MockMeal.mockMeals)
                }
            } else {
                await performMealsNetworkRequest()
            }

        }
    }

    private func performMealsNetworkRequest() async {
        do {
            let meals = try await NetworkManager.performDataTask(
                withRequest: MealsListRequest(category: .dessert)
            )
            let fetchedMeals = meals.meals
                .sorted { $0.name < $1.name }
            self.loadState = .loaded(items: fetchedMeals)
        } catch {
            self.loadState = .errorLoadingItems
        }
    }
}

struct MealsListScreen: View {

    @State private var viewModel: MealsListViewModel
    @State private var navigationPath: [MealsListNavigationItem] = []

    init(mealCategory: MealCategory, isMockData: Bool = false) {
        self._viewModel = State(initialValue: .init(category: mealCategory, isMockData: isMockData))
    }


    @ViewBuilder
    private func loadingState() -> some View {
        ScrollView {
            VStack {
                Text("Fetching Meals...")
                ProgressView()
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemGroupedBackground))
    }

    @ViewBuilder
    private func emptyState() -> some View {
        ScrollView {
            Text("No Meals of category \(viewModel.category.rawValue)")
        }
        .background(Color(uiColor: .systemGroupedBackground))
    }

    @ViewBuilder
    private func loadedState(meals: [any MealPreviewRepresentable]) -> some View {
        List {
            ForEach(meals, id: \.id) { meal in
                NavigationLink(value: MealsListNavigationItem.mealDetail(mealD: meal.id)) {
                    MealCell(meal: meal)
                }
            }
        }
    }

    @ViewBuilder
    private func errorState() -> some View {
        ScrollView {
            Text("Error loading meals :(")
        }
        .background(Color(uiColor: .systemGroupedBackground))
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                switch viewModel.loadState {
                    case .loadingItems:
                        loadingState()
                    case .loaded(let meals):
                        loadedState(meals: meals)
                    case .errorLoadingItems:
                        errorState()
                }
            }
            .navigationDestination(for: MealsListNavigationItem.self) { item in
                switch item {
                    case let .mealDetail(mealD: mealID):
                        RecipeScreen(mealID: mealID)
                }
            }
            .navigationTitle(viewModel.category.navigationTitle)
            .onAppear {
                viewModel.fetchMeals()
            }
        }
    }

}

#Preview {
    MealsListScreen(mealCategory: .dessert, isMockData: true)
}
