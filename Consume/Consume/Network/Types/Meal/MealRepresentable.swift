//
//  MealRepresentable.swift
//  Consume
//
//  Created by Lonnie Gerol on 2/4/24.
//

import Foundation

protocol MealPreviewRepresentable {
    var name: String { get }
    var thumbnailURL: URL { get }
    var id: String { get }
}
