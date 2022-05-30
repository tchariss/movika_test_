//
//  StartScreen.swift
//  Movika_test
//
//  Created by Tennie Charissa on 5/19/22.
//  Copyright © 2022 Tennie Charissa. All rights reserved.
//

import Foundation
import UIKit

protocol SenderButton: AnyObject {
    func buttonPlayClicked(sender: UIButton)
}

class StartScreenView: UIView {
    
    weak var delegate: SenderButton?
    
    lazy var buttonPlay: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Играть", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.09578619152, green: 0.08422815055, blue: 0.195324868, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(startClickHandler), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.09578619152, green: 0.08422815055, blue: 0.195324868, alpha: 1)
        addSubview(buttonPlay)
    }
    
    override func layoutSubviews() {
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func startClickHandler(sender: UIButton)
    {
        print("tap buttonStart")
        delegate?.buttonPlayClicked(sender: sender)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            buttonPlay.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonPlay.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonPlay.widthAnchor.constraint(equalToConstant: frame.width / 5),
            buttonPlay.heightAnchor.constraint(equalTo: buttonPlay.widthAnchor, multiplier: 1/2),
        ])
    }
}
