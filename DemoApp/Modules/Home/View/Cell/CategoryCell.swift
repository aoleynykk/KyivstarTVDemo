//
//  CategoryCell.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 21.10.2024.
//

import UIKit

class CategoryCell: UICollectionViewCell, Reusable {

    var model: Category? {
        didSet {
            handleUI()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setup() {
        contentView.backgroundColor = .green
    }
}

extension CategoryCell {
    private func handleUI() {
        guard let model else { return }


    }
}

