//
//  MealDetailScreen.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import SwiftUI
import Observation

@Observable
class MealDetailViewModel {

    let mealID: String
    let isMockData: Bool

    var loadState: LoadingState<any RecipeRepresentable> = .loadingItems

    init(mealID: String, isMock: Bool = false) {
        self.mealID = mealID
        self.isMockData = isMock
    }

    func fetchMeals() {
        Task {
            if isMockData {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.loadState = .loaded(items: MockRecipe.mockRecipe)
                }
            } else {
                await performRecipeNetworkRequest()
            }
        }
    }

    private func performRecipeNetworkRequest() async {
        do {
            guard let recipe = try await NetworkManager.performDataTask(
                withRequest: RecipeRequest(mealID: mealID)
            ).meals.first else {
                self.loadState = .errorLoadingItems
                return
            }
            self.loadState = .loaded(items: recipe)
        } catch {
            self.loadState = .errorLoadingItems
        }
    }

}

struct RecipeScreen: View {

    @State private var viewModel: MealDetailViewModel

    init(mealID: String, isMockData: Bool = false) {
        self._viewModel = State(
            initialValue: MealDetailViewModel(
                mealID: mealID,
                isMock: isMockData
            )
        )
    }

    @ViewBuilder
    private func errorView() -> some View {
        Text("An error occurred while trying to fetch the recipe.")
    }

    @ViewBuilder
    private func loadingView() -> some View {
        ScrollView {
            VStack {
                Text("Loading Recipe...")
                ProgressView()
            }
        }
    }

    @ViewBuilder
    private func loadedView(recipe: RecipeRepresentable) -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                header(recipe: recipe)
                Divider()
                if !recipe.ingredients.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Ingredients")
                            .font(.title3)
                            .fontWeight(.medium)
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            Text(" - **\(ingredient.ingredient)** (\(ingredient.unit))")
                        }
                    }
                    Divider()
                }
                VStack(alignment: .leading) {
                    Text("Instructions")
                        .font(.title3)
                        .fontWeight(.medium)
                    Text(recipe.instructions)
                }
            }
            .padding()
        }
    }

    @ViewBuilder
    private func header(recipe: RecipeRepresentable) -> some View {
        HStack(alignment: .top) {
            AsyncImage(url: recipe.thumbnailURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .clipShape(.rect(cornerRadius: UIConstants.imageCornerRadius))
            .frame(width: 75, height: 75)
            Text(recipe.name)
                .font(.title)
        }
    }

    var body: some View {
        VStack {
            switch viewModel.loadState {
                case .loadingItems:
                    loadingView()
                case .loaded(let items):
                    loadedView(recipe: items)
                case .errorLoadingItems:
                    errorView()
            }
        }
        .onAppear {
            print("showing recipe with id \(viewModel.mealID)")
            viewModel.fetchMeals()
        }
        .toolbarTitleDisplayMode(.inline)
        .navigationTitle("Recipe")
    }

}

#Preview {
    NavigationStack {
        RecipeScreen(mealID: "", isMockData: true)
    }
}
