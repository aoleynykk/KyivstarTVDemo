//
//  PromotionCell.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 21.10.2024.
//

import UIKit

class PromotionCell: UICollectionViewCell, Reusable {

    var model: Promotion? {
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
        contentView.backgroundColor = .red
    }
}

extension PromotionCell {
    private func handleUI() {
        guard let model else { return }

        
    }
}
