//
//  PathSVG.swift
//  Movika_test
//
//  Created by Tennie Charissa on 4/22/22.
//  Copyright © 2022 Tennie Charissa. All rights reserved.
//

import UIKit

class PathSVG: NSObject {

    static let shapeArray : [UIBezierPath] = [
        shape1, shape2, shape3, shape4, shape5, shape6, shape7, shape8, shape9, shape10, shape11, shape12, shape13, shape14
    ]
    
    // MARK: - Shape    
    static let shape1: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 46.02, y: 206.28))
        shape.addCurve(to: CGPoint(x: 46.71, y: 192.89), controlPoint1: CGPoint(x: 46.02, y: 206.28), controlPoint2: CGPoint(x: 45.8, y: 201.16))
        shape.addCurve(to: CGPoint(x: 322.99, y: 67), controlPoint1: CGPoint(x: 50.55, y: 158.11), controlPoint2: CGPoint(x: 83.55, y: 67.59))
        return shape
    }()
    
    static let shape2: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 242.81, y: 250))
        shape.addCurve(to: CGPoint(x: 126.02, y: 139.44), controlPoint1: CGPoint(x: 242.81, y: 250), controlPoint2: CGPoint(x: 252.99, y: 138.71))
        shape.addCurve(to: CGPoint(x: 126.02, y: 24), controlPoint1: CGPoint(x: 125.98, y: 88.5), controlPoint2: CGPoint(x: 126.02, y: 24))
        return shape
    }()
    
    static let shape3: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 126.75, y: 24.12))
        shape.addCurve(to: CGPoint(x: 242.98, y: 134.54), controlPoint1: CGPoint(x: 126.75, y: 24.12), controlPoint2: CGPoint(x: 116.61, y: 135.27))
        shape.addCurve(to: CGPoint(x: 242.98, y: 249.84), controlPoint1: CGPoint(x: 243.02, y: 185.42), controlPoint2: CGPoint(x: 242.98, y: 249.84))
        return shape
    }()
    
    static let shape4: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 314, y: 53))
        shape.addCurve(to: CGPoint(x: 95.71, y: 197.11), controlPoint1: CGPoint(x: 314, y: 53), controlPoint2: CGPoint(x: 143.85, y: 211.43))
        shape.addCurve(to: CGPoint(x: 73.19, y: 90.69), controlPoint1: CGPoint(x: 47.58, y: 182.78), controlPoint2: CGPoint(x: 44.89, y: 94.68))
        shape.addCurve(to: CGPoint(x: 295.93, y: 221), controlPoint1: CGPoint(x: 101.5, y: 86.7), controlPoint2: CGPoint(x: 295.93, y: 221))
        return shape
    }()
    
    static let shape5: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 156.31, y: 236))
        shape.addCurve(to: CGPoint(x: 207.64, y: 126.82), controlPoint1: CGPoint(x: 156.31, y: 236), controlPoint2: CGPoint(x: 194.89, y: 179.59))
        shape.addCurve(to: CGPoint(x: 148.64, y: 38), controlPoint1: CGPoint(x: 217.8, y: 84.76), controlPoint2: CGPoint(x: 197.79, y: 38.12))
        shape.addCurve(to: CGPoint(x: 90.03, y: 122.23), controlPoint1: CGPoint(x: 50.01, y: 37.87), controlPoint2: CGPoint(x: 90.03, y: 122.23))
        shape.addLine(to: CGPoint(x: 286, y: 122.23))
        return shape
    }()
    
    static let shape6: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 150.29, y: 241))
        shape.addCurve(to: CGPoint(x: 115.36, y: 82.41), controlPoint1: CGPoint(x: 150.29, y: 241), controlPoint2: CGPoint(x: 156.46, y: 82.41))
        shape.addCurve(to: CGPoint(x: 89.17, y: 136.6), controlPoint1: CGPoint(x: 56.37, y: 82.41), controlPoint2: CGPoint(x: 68.12, y: 136.6))
        shape.addLine(to: CGPoint(x: 275.27, y: 136.6))
        shape.addCurve(to: CGPoint(x: 263.81, y: 194.78), controlPoint1: CGPoint(x: 311.59, y: 136.6), controlPoint2: CGPoint(x: 295.32, y: 192.83))
        shape.addCurve(to: CGPoint(x: 239.2, y: 33), controlPoint1: CGPoint(x: 194.12, y: 204.56), controlPoint2: CGPoint(x: 239.2, y: 33))
        return shape
    }()
    
    static let shape7: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 93, y: 300))
        shape.addLine(to: CGPoint(x: 232.17, y: 82.56))
        shape.addLine(to: CGPoint(x: 96.28, y: 80.4))
        shape.addLine(to: CGPoint(x: 90, y: 39))
        shape.addLine(to: CGPoint(x: 10, y: 20))
        return shape
    }()
    
    static let shape8: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 315, y: 70.49))
        shape.addLine(to: CGPoint(x: 315, y: 205))
        shape.addCurve(to: CGPoint(x: 53, y: 70), controlPoint1: CGPoint(x: 315, y: 205), controlPoint2: CGPoint(x: 304.96, y: 70))
        return shape
    }()
   
    static let shape9: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 274.3, y: 150.16))
        shape.addCurve(to: CGPoint(x: 205.22, y: 64.62), controlPoint1: CGPoint(x: 334.51, y: 92.58), controlPoint2: CGPoint(x: 268.37, y: 33.44))
        shape.addCurve(to: CGPoint(x: 180.23, y: 218), controlPoint1: CGPoint(x: 142.06, y: 95.81), controlPoint2: CGPoint(x: 180.23, y: 218))
        shape.addLine(to: CGPoint(x: 70, y: 122.14))
        return shape
    }()
    
    static let shape10: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 279, y: 235))
        shape.addCurve(to: CGPoint(x: 128.8, y: 233.06), controlPoint1: CGPoint(x: 275.11, y: 131.33), controlPoint2: CGPoint(x: 133.62, y: 137.61))
        shape.addCurve(to: CGPoint(x: 105.05, y: 124.44), controlPoint1: CGPoint(x: 118.75, y: 194.19), controlPoint2: CGPoint(x: 105.05, y: 124.44))
        shape.addLine(to: CGPoint(x: 232.17, y: 82.56))
        shape.addLine(to: CGPoint(x: 96.28, y: 80.4))
        shape.addLine(to: CGPoint(x: 90, y: 39))
        return shape
    }()
    
    static let shape11: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 195.13, y: 160.72))
        shape.addCurve(to: CGPoint(x: 264, y: 160.72), controlPoint1: CGPoint(x: 195.13, y: 160.72), controlPoint2: CGPoint(x: 236.42, y: 159.59))
        shape.addCurve(to: CGPoint(x: 154.43, y: 165.43), controlPoint1: CGPoint(x: 264, y: 267.02), controlPoint2: CGPoint(x: 154.43, y: 264.26))
        shape.addLine(to: CGPoint(x: 154.43, y: 38.39))
        shape.addCurve(to: CGPoint(x: 127.83, y: 101.12), controlPoint1: CGPoint(x: 113.09, y: 13.72), controlPoint2: CGPoint(x: 81.73, y: 101.12))
        shape.addLine(to: CGPoint(x: 246.78, y: 101.12))
        return shape
    }()
    
    static let shape12: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 109.57, y: 221.9))
        shape.addCurve(to: CGPoint(x: 211.62, y: 113.23), controlPoint1: CGPoint(x: 109.57, y: 221.9), controlPoint2: CGPoint(x: 187.38, y: 137.59))
        shape.addCurve(to: CGPoint(x: 92.22, y: 113.23), controlPoint1: CGPoint(x: 232.27, y: 26.46), controlPoint2: CGPoint(x: 63.9, y: 26.05))
        shape.addCurve(to: CGPoint(x: 185.09, y: 226), controlPoint1: CGPoint(x: 117.38, y: 146.65), controlPoint2: CGPoint(x: 185.09, y: 226))
        shape.addLine(to: CGPoint(x: 280, y: 162.44))
        return shape
    }()
    
    static let shape13: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 83, y: 139.88))
        shape.addLine(to: CGPoint(x: 277.95, y: 139.88))
        shape.addCurve(to: CGPoint(x: 227.19, y: 93.87), controlPoint1: CGPoint(x: 297.04, y: 139.88), controlPoint2: CGPoint(x: 282.97, y: 67.87))
        shape.addCurve(to: CGPoint(x: 214.51, y: 248), controlPoint1: CGPoint(x: 171.42, y: 119.87), controlPoint2: CGPoint(x: 214.51, y: 248))
        shape.addLine(to: CGPoint(x: 85.31, y: 26))
        return shape
    }()
    
    static let shape14: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 93, y: 244))
        shape.addCurve(to: CGPoint(x: 276, y: 98.11), controlPoint1: CGPoint(x: 93, y: 244), controlPoint2: CGPoint(x: 235.26, y: 237.73))
        shape.addCurve(to: CGPoint(x: 128.14, y: 162.3), controlPoint1: CGPoint(x: 218.04, y: 123.74), controlPoint2: CGPoint(x: 143.18, y: 156.68))
        shape.addCurve(to: CGPoint(x: 189.62, y: 31), controlPoint1: CGPoint(x: 113.65, y: 123.5), controlPoint2: CGPoint(x: 189.62, y: 31))
        shape.addLine(to: CGPoint(x: 95.93, y: 84.98))
        return shape
    }()
    
    // MARK: - Timer
    static let lineLeft: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 26.46, y: 0.5))
        shape.addCurve(to: CGPoint(x: 1.02, y: 142.76), controlPoint1: CGPoint(x: 26.46, y: 0.5), controlPoint2: CGPoint(x: 1.02, y: 72.14))
        shape.addCurve(to: CGPoint(x: 26.46, y: 279), controlPoint1: CGPoint(x: 1.02, y: 211.36), controlPoint2: CGPoint(x: 26.46, y: 279))
        return shape
    }()
    
    static let lineRight: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 1.03, y: 0.5))
        shape.addCurve(to: CGPoint(x: 32.73, y: 142.76), controlPoint1: CGPoint(x: 1.03, y: 0.5), controlPoint2: CGPoint(x: 32.73, y: 72.14))
        shape.addCurve(to: CGPoint(x: 1.03, y: 279), controlPoint1: CGPoint(x: 32.73, y: 211.36), controlPoint2: CGPoint(x: 1.03, y: 279))
        return shape
    }()
    
    static let shapeTimerRight: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 0.88, y: 16.79))
        shape.addLine(to: CGPoint(x: 5.94, y: 0.01))
        shape.addCurve(to: CGPoint(x: 36.94, y: 137.43), controlPoint1: CGPoint(x: 5.94, y: 0.01), controlPoint2: CGPoint(x: 36.94, y: 68.75))
        shape.addCurve(to: CGPoint(x: 5.94, y: 274.5), controlPoint1: CGPoint(x: 36.94, y: 205.99), controlPoint2: CGPoint(x: 5.94, y: 274.5))
        shape.addLine(to: CGPoint(x: 0.88, y: 257.71))
        shape.addCurve(to: CGPoint(x: 31.88, y: 137.57), controlPoint1: CGPoint(x: 0.88, y: 257.71), controlPoint2: CGPoint(x: 31.88, y: 206.09))
        shape.addCurve(to: CGPoint(x: 0.88, y: 16.79), controlPoint1: CGPoint(x: 31.88, y: 68.84), controlPoint2: CGPoint(x: 0.88, y: 16.79))
        shape.close()
        return shape
    }()
    
    static let shapeTimerLeft: UIBezierPath = {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 29, y: 16.79))
        shape.addLine(to: CGPoint(x: 24.94, y: 0.01))
        shape.addCurve(to: CGPoint(x: 0.06, y: 137.43), controlPoint1: CGPoint(x: 24.94, y: 0.01), controlPoint2: CGPoint(x: 0.06, y: 68.75))
        shape.addCurve(to: CGPoint(x: 24.94, y: 274.5), controlPoint1: CGPoint(x: 0.06, y: 205.99), controlPoint2: CGPoint(x: 24.94, y: 274.5))
        shape.addLine(to: CGPoint(x: 29, y: 257.71))
        shape.addCurve(to: CGPoint(x: 4.12, y: 137.57), controlPoint1: CGPoint(x: 29, y: 257.71), controlPoint2: CGPoint(x: 4.12, y: 206.09))
        shape.addCurve(to: CGPoint(x: 29, y: 16.79), controlPoint1: CGPoint(x: 4.12, y: 68.84), controlPoint2: CGPoint(x: 29, y: 16.79))
        shape.close()
        return shape
    }()
}

