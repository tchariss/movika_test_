//
//  AnimationView.swift
//  Movika_test
//
//  Created by Janusz on 21.05.2022.
//  Copyright © 2022 Tennie Charissa. All rights reserved.
//

import Foundation
import UIKit

class AnimationView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("frame init = \(frame)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let bgImage = UIImage(named: "photoBG")
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        image.image = bgImage
        return image
    }()
    
    lazy var viewForShape: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var shape: CAShapeLayer = {
        let shape = CAShapeLayer()
        shape.path = shapeNumber.cgPath
        shape.strokeColor = UIColor.white.cgColor
        shape.lineWidth = 1
        shape.fillColor = .none
        return shape
    }()
    
    private let circle: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        view.backgroundColor = Static.color
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var progressLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = shapeNumber.cgPath
        layer.lineWidth = 2
        layer.strokeColor = Static.color.cgColor
        layer.fillColor = .none
        layer.strokeEnd = 0
        return layer
    }()
    
    private let shapeNumber: UIBezierPath = Helper.randomShape()
    private let labelLeft: UILabel = Helper.createLabel()
    private let labelRight: UILabel = Helper.createLabel()
    private var startTime = 100
    private let endTime = 0
    private var flagAnimation = false
    private lazy var progressLineView = ProgressLineView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    
    
    func addConstraintsView() {
        
        print("addConstraints: frame = \(frame)")
        
        NSLayoutConstraint.activate([
            viewForShape.widthAnchor.constraint(equalToConstant: shapeNumber.bounds.width),
            viewForShape.heightAnchor.constraint(equalToConstant: shapeNumber.bounds.height),
            viewForShape.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -shapeNumber.bounds.minX),
            viewForShape.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -shapeNumber.bounds.minY),
            
            labelLeft.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelLeft.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120),
            
            labelRight.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelRight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120),
        ])
    }
    
    func addSublayerAndView() {
        addSubview(imageView)
        
        viewForShape.layer.addSublayer(shape)
        viewForShape.layer.addSublayer(progressLayer)
        viewForShape.addSubview(circle)
        
        [viewForShape, labelLeft, labelRight, progressLineView].forEach {
            addSubview($0)
        }
    }
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            self.animationLabel()
            if self.flagAnimation {
                timer.invalidate()
            }
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Time is over", message: "Please try later", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true)
    }
    
    func deleteAnimation() {
        progressLayer.removeAllAnimations()
        
        circle.layer.removeAllAnimations()
        circle.removeFromSuperview()
        labelLeft.textColor = .white
        labelRight.textColor = .white
        flagAnimation = true
        
        showAlert()
    }
    
    @objc func animationLabel() {
        startTime -= 10
        
        labelLeft.text = "\(startTime)"
        labelRight.text = "\(startTime)"
        labelLeft.textColor = Static.color
        labelRight.textColor = Static.color
        
        if startTime == endTime {
            deleteAnimation()
        }
    }
    
    func animationVector() {
        let animationCircle = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animationCircle.path = shape.path
        animationCircle.duration = Static.durationShape
        animationCircle.repeatCount = .infinity
        
        let animationShape = CABasicAnimation(keyPath: "strokeEnd")
        animationShape.toValue = 1
        animationShape.repeatCount = .infinity
        animationShape.duration = Static.durationShape
        
        circle.layer.add(animationCircle, forKey: nil)
        progressLayer.add(animationShape, forKey: nil)
    }
}

private enum Static {
    static let durationShape: Double = 8.0
    static let color: UIColor = UIColor(red: 1, green: 0, blue: 0.349, alpha: 1.0)
}
