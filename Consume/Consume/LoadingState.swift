//
//  LoadingState.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

enum LoadingState<T> {
    case loadingItems
    case loaded(items: T)
    case errorLoadingItems
}
