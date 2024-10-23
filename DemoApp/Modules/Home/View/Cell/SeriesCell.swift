//
//  SeriesCell.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 21.10.2024.
//

import Foundation
import UIKit

class SeriesCell: UICollectionViewCell, Reusable {

    var model: Asset? {
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
        contentView.backgroundColor = .gray
    }
}

extension SeriesCell {
    private func handleUI() {
        guard let model else { return }


    }
}

