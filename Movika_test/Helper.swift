//
//  Helper.swift
//  Movika_test
//
//  Created by Tennie Charissa on 24.04.2022.
//  Copyright © 2022 Tennie Charissa. All rights reserved.
//

import UIKit

class Helper {
    
    static func createLabel() -> UILabel {
        let label = UILabel()
        label.text = "100"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func randomShape() -> UIBezierPath {
        let number: UInt32 = 13
        let random = arc4random_uniform(number)
        return PathSVG.shapeArray[Int(random)]
    }
    
}
