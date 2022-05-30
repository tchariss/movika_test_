//
//  ProgressLineView.swift
//  Movika_test
//
//  Created by Tennie Charissa on 5/17/22.
//  Copyright © 2022 Tennie Charissa. All rights reserved.
//

import Foundation
import UIKit

class ProgressLineView: UIView {

    // MARK: - Properties
    private lazy var time = 20.0
    private lazy var timeInterval = 0.05
    
    lazy var timeEmptyLeftImage = UIImage(named: "timeout_empty_left")
    lazy var timeEmptyRightImage = UIImage(named: "timeout_empty_right")
    lazy var timeFillLeftImage = UIImage(named: "timeout_filled_left")
    lazy var timeFillRightImage = UIImage(named: "timeout_filled_right")
    
    private lazy var widthImageView = (timeEmptyLeftImage?.size.width ?? 25) * 1.5
    private lazy var heightImageView = (timeEmptyLeftImage?.size.height ?? 204) * 1.5
    
    lazy var timeEmptyLeftImageViewHeight = timeEmptyLeftImage?.size.height
    
    lazy var timeEmptyLeftImageView = UIImageView(image: timeEmptyLeftImage)
    lazy var timeEmptyRightImageView = UIImageView(image: timeEmptyRightImage)

    lazy var timeFillLeftImageView = UIImageView(image: timeFillLeftImage)
    lazy var timeFillRightImageView = UIImageView(image: timeFillRightImage)
    lazy var cropView = UIView()
    
    private lazy var runTime: CGFloat = 0 {
        didSet {
            self.animation()
        }
    }
    
    // MARK: - Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProgressLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func timer() {
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            self.runTime += timer.timeInterval
            
            if self.runTime >= self.time {
                timer.invalidate()
            }
        }
    }

    
    func setProgressLine() {
        cropView.frame = CGRect(x: 0, y: (self.frame.height) / 2, width: self.frame.width, height: 0)
        timeEmptyLeftImageView.frame = CGRect(x: 60, y: (self.frame.height - heightImageView) / 2, width: widthImageView, height: heightImageView)
        timeEmptyRightImageView.frame = CGRect(x: self.frame.width - 60 - widthImageView, y: (self.frame.height - heightImageView) / 2, width: widthImageView, height: heightImageView)
        
        self.addSubview(timeEmptyRightImageView)
        self.addSubview(timeEmptyLeftImageView)
        
        let rightLayer = CALayer()
        rightLayer.contents = timeFillRightImageView
        rightLayer.frame = timeFillRightImageView.bounds
        rightLayer.masksToBounds = true
        rightLayer.contentsGravity = .resizeAspect
        
        let leftLayer = CALayer()
        leftLayer.contents = timeFillLeftImageView
        leftLayer.frame = cropView.frame
        leftLayer.masksToBounds = true
        leftLayer.contentsGravity = .resizeAspect
        
        cropView.layer.masksToBounds = true
        cropView.layer.addSublayer(timeFillLeftImageView.layer)
        cropView.layer.addSublayer(timeFillRightImageView.layer)
        self.addSubview(cropView)
        
        animation()
        timer()
    }
    
    func animation() {
        let height = runTime / time * heightImageView
        
        cropView.frame = CGRect(x: 0, y: (self.frame.height - height) / 2, width: self.frame.width, height: height )
        timeFillLeftImageView.frame = CGRect(x: 60, y: (-heightImageView + height) / 2, width: widthImageView, height: heightImageView)
        timeFillRightImageView.frame = CGRect(x: self.frame.width - 60 - widthImageView, y: (-heightImageView + height) / 2, width: widthImageView, height: heightImageView)
    }
}

