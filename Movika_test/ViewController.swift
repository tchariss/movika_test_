//
//  ViewController.swift
//  Movika_test
//
//  Created by Tennie Charissa on 4/22/22.
//  Copyright © 2022 Tennie Charissa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private let bgImage = UIImage(named: "photoBG")
    private let myViewRight: UIView = Helper.createUIView()
    private let rightLineView: UIView = Helper.createUIView()
    private let myViewLeft: UIView = Helper.createUIView()
    private let leftLineView: UIView = Helper.createUIView()
    private let shapeNumber: UIBezierPath = Helper.randomShape()
    private let labelLeft: UILabel = Helper.createLabel()
    private let labelRight: UILabel = Helper.createLabel()
    private var startTime = 100
    private let endTime = 0
    private var flagAnimation = false
    private var lastPoint = CGPoint.zero // первая и последняя нарисованная точка на холсте`
    private var swipe =  false // непрерывность
    
    private let lineColorRightStart = createColorLine(path: PathSVG.lineRight.cgPath, isStart: false)
    private let lineColorRightEnd = createColorLine(path: PathSVG.lineRight.cgPath, isStart: true)
    private let lineColorLeftStart = createColorLine(path: PathSVG.lineLeft.cgPath, isStart: false)
    private let lineColorLeftEnd = createColorLine(path: PathSVG.lineLeft.cgPath, isStart: true)
    private let shapeTimerRight = createShapeOrLine(path: PathSVG.shapeTimerRight.cgPath, isLine: false)
    private let lineRight = createShapeOrLine(path: PathSVG.lineRight.cgPath, isLine: true)
    private let shapeTimerLeft = createShapeOrLine(path: PathSVG.shapeTimerLeft.cgPath, isLine: false)
    private let lineLeft = createShapeOrLine(path: PathSVG.lineLeft.cgPath, isLine: true)
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
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
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        addSublayerAndView()
        addConstraintsView()
        animationVector()
        timer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.landscapeRight)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.all)
    }
    
    static func createColorLine(path: CGPath, isStart: Bool) -> CAShapeLayer {
        let shape = CAShapeLayer()
        shape.path = path
        shape.lineWidth = 2
        shape.strokeColor = Static.color.cgColor
        shape.fillColor = .none
        if isStart {
            shape.strokeStart = Static.centerLine
        } else {
            shape.strokeEnd = Static.centerLine
        }
        return shape
    }
    
    static func createShapeOrLine(path: CGPath, isLine: Bool) -> CAShapeLayer {
        let shape = CAShapeLayer()
        shape.path = path
        if isLine {
            shape.strokeColor = UIColor.white.cgColor
            shape.fillColor = .none
        } else {
            shape.fillColor = UIColor.white.cgColor
            shape.opacity = 0.5
        }
        return shape
    }
    
    func addConstraintsView() {
        NSLayoutConstraint.activate([
            viewForShape.widthAnchor.constraint(equalToConstant: shapeNumber.bounds.width * 1.5),
            viewForShape.heightAnchor.constraint(equalToConstant: shapeNumber.bounds.height * 1.5),
            viewForShape.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewForShape.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            myViewRight.heightAnchor.constraint(equalToConstant: PathSVG.shapeTimerRight.bounds.height),
            myViewRight.widthAnchor.constraint(equalToConstant: PathSVG.shapeTimerLeft.bounds.width),
            myViewRight.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myViewRight.trailingAnchor.constraint(equalTo: rightLineView.leadingAnchor, constant: 20),
            
            rightLineView.heightAnchor.constraint(equalToConstant: PathSVG.lineRight.bounds.height),
            rightLineView.widthAnchor.constraint(equalToConstant: PathSVG.lineRight.bounds.width),
            rightLineView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            myViewLeft.heightAnchor.constraint(equalToConstant: PathSVG.shapeTimerLeft.bounds.height),
            myViewLeft.widthAnchor.constraint(equalToConstant: PathSVG.shapeTimerRight.bounds.width),
            myViewLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myViewLeft.leadingAnchor.constraint(equalTo: leftLineView.trailingAnchor, constant: -20),
            
            labelLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelLeft.leadingAnchor.constraint(equalTo: myViewLeft.trailingAnchor, constant: 8),
            
            labelRight.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelRight.trailingAnchor.constraint(equalTo: myViewRight.leadingAnchor, constant: -8),
            
            leftLineView.heightAnchor.constraint(equalToConstant: PathSVG.lineLeft.bounds.height),
            leftLineView.widthAnchor.constraint(equalToConstant: PathSVG.lineLeft.bounds.width),
            leftLineView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
    }
    
    func addSublayerAndView() {
        view.addSubview(imageView)
        viewForShape.layer.addSublayer(shape)
        myViewLeft.layer.addSublayer(shapeTimerLeft)
        leftLineView.layer.addSublayer(lineLeft)
        leftLineView.layer.addSublayer(lineColorLeftEnd)
        leftLineView.layer.addSublayer(lineColorLeftStart)
        myViewRight.layer.addSublayer(shapeTimerRight)
        rightLineView.layer.addSublayer(lineRight)
        rightLineView.layer.addSublayer(lineColorRightEnd)
        rightLineView.layer.addSublayer(lineColorRightStart)
        viewForShape.layer.addSublayer(progressLayer)
        viewForShape.addSubview(circle)
        
        [viewForShape, myViewLeft, leftLineView, myViewRight, rightLineView, labelLeft, labelRight].forEach {
            view.addSubview($0)
        }
    }
    
    private func timer() {
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
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func deleteAnimation() {
        progressLayer.removeAllAnimations()
        lineColorRightStart.removeAllAnimations()
        lineColorRightStart.strokeColor = UIColor.white.cgColor
        lineColorRightEnd.removeAllAnimations()
        lineColorRightEnd.strokeColor = UIColor.white.cgColor
        lineColorLeftStart.removeAllAnimations()
        lineColorLeftStart.strokeColor = UIColor.white.cgColor
        lineColorLeftEnd.removeAllAnimations()
        lineColorLeftEnd.strokeColor = UIColor.white.cgColor
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
        
        let animationLineStart = CABasicAnimation(keyPath: "strokeStart")
        animationLineStart.fromValue = Static.centerLine
        animationLineStart.toValue = 0
        animationLineStart.duration = Static.durationLine
        
        let animationLineEnd = CABasicAnimation(keyPath: "strokeEnd")
        animationLineEnd.fromValue = Static.centerLine
        animationLineEnd.toValue = 1
        animationLineEnd.duration = Static.durationLine
        
        circle.layer.add(animationCircle, forKey: nil)
        progressLayer.add(animationShape, forKey: nil)
        lineColorRightStart.add(animationLineStart, forKey: nil)
        lineColorRightEnd.add(animationLineEnd, forKey: nil)
        lineColorLeftStart.add(animationLineStart, forKey: nil)
        lineColorLeftEnd.add(animationLineEnd, forKey: nil)
    }
}

// MARK: - Методы уведомления о касании : UIResponder

extension ViewController {
    
    // Первое касание экрана - начало
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        swipe = false
        lastPoint = touch.location(in: view)
    }
    
    func drawLine(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(view.frame.size) // Создает графический контекст на основе растрового изображения и делает его текущим контекстом
        guard let context = UIGraphicsGetCurrentContext() else { return } // Возвращает текущий графический контекст
        
        imageView.image?.draw(in: view.bounds)
        
        // Получаем текущую точку касания и рисуем линию от firstPont до currentPoint
        context.move(to: fromPoint) // Начинает новый подпуть в указанной точке
        context.addLine(to: toPoint) // Добавляет отрезок прямой линии из текущей точки в указанную точку
        context.setLineWidth(2)
        context.setLineCap(.round)
        context.setStrokeColor(UIColor.white.cgColor)
        context.strokePath() // Рисует линию вдоль текущего пути
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext() // Возвращает изображение на основе содержимого текущего графического контекста
        imageView.alpha = 1.0
        UIGraphicsEndImageContext() // Удаляет текущий контекст растровой графики из вершины стека
    }
    
    // Пользователь проводит пальцем по экрану
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        swipe = true
        let currentPoint = touch.location(in: view) // location - Возвращает текущее местоположение приемника в системе координат данного вида
        //        print(shape.path?.contains(currentPoint)) // Соприкосновение точек фигуры и нарисованной линии
        drawLine(fromPoint: lastPoint, toPoint: currentPoint)
        lastPoint = currentPoint
    }
    
    // Пользователь убирает палец с экрана
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swipe {
            drawLine(fromPoint: lastPoint, toPoint: lastPoint)
        }
        imageView.image = bgImage
    }
}

private enum Static {
    static let durationShape: Double = 8.0
    static let durationLine: Double = 25.0
    static let centerLine: Double = 0.5
    static let color: UIColor = UIColor(red: 1, green: 0, blue: 0.349, alpha: 1.0)
}
