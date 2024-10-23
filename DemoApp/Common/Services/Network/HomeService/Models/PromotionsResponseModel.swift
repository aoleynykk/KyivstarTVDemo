//
//  PromotionsResponseModel.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 21.10.2024.
//

import Foundation

struct PromotionsResponseModel: Codable {
    let id, name: String
    let promotions: [Promotion]
}

struct Promotion: Codable, Hashable {
    let id, name: String
    let image: String
    let company, updatedAt, releaseDate: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Promotion, rhs: Promotion) -> Bool {
        return lhs.id == rhs.id
    }
}
