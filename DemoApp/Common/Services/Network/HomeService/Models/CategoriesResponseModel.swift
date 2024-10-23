//
//  CategoriesResponseModel.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 21.10.2024.
//

import Foundation

struct CategoriesResponseModel: Codable {
    let categories: [Category]
}

struct Category: Codable, Hashable {
    let id, name: String
    let image: String

    func hash(into hasher: inout Hasher) {
           hasher.combine(id)
       }

       static func == (lhs: Category, rhs: Category) -> Bool {
           return lhs.id == rhs.id
       }
}
