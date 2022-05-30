//
//  ViewController.swift
//  Movika_test
//
//  Created by Tennie Charissa on 4/22/22.
//  Copyright © 2022 Tennie Charissa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SenderButton {
    
    // MARK: - Properties
    private var lastPoint = CGPoint.zero // первая и последняя нарисованная точка на холсте`
    private var swipe =  false // непрерывность
    private var startView = StartScreenView()
    private var animationView = AnimationView()
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        startView.delegate = self
    }
    
    override func loadView() {
        view = startView
    }
    
    func buttonPlayClicked(sender: UIButton) {
        animationView.frame = view.bounds
        view.addSubview(animationView)
        
        animationView.addSublayerAndView()
        animationView.addConstraintsView()
        animationView.animationVector()
        animationView.timer()
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
        
        animationView.imageView.image?.draw(in: view.bounds)
        
        // Получаем текущую точку касания и рисуем линию от firstPont до currentPoint
        context.move(to: fromPoint) // Начинает новый подпуть в указанной точке
        context.addLine(to: toPoint) // Добавляет отрезок прямой линии из текущей точки в указанную точку
        context.setLineWidth(2)
        context.setLineCap(.round)
        context.setStrokeColor(UIColor.white.cgColor)
        context.strokePath() // Рисует линию вдоль текущего пути
        
        animationView.imageView.image = UIGraphicsGetImageFromCurrentImageContext() // Возвращает изображение на основе содержимого текущего графического контекста
        animationView.imageView.alpha = 1.0
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
        animationView.imageView.image =  animationView.bgImage
    }
}
