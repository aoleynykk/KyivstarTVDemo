//
//  UIColor + ext.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 21.10.2024.
//

import Foundation
import UIKit

extension UIColor {
    enum ColorType {
        case background
    }

    static func colors(_ colorType: ColorType) -> UIColor {
        var color: UIColor?

        switch colorType {
        case .background:
            color = UIColor(named: "Background")!
        }

        //TODO: remove
        guard let color = color else {
            fatalError("Color \(colorType) not found")
        }

        return color
    }
}
