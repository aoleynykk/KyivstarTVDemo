//
//  HomeModel.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 21.10.2024.
//

import Foundation

enum Section: Int, CaseIterable {
    case promotions, categories, series, livechannels, epgs
}

enum Item: Hashable {
    case promotion(Promotion)
    case category(Category)
    case series(Asset)
    case livechannel(Asset)
    case epg(Asset)
}
