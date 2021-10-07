//
//  ThirdSmallButton.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

final class ThirdSmallButton: UIView {
    
    //MARK: Create Variable
    private var sound: NameSound = .tapButton
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.zPosition = -1
        view.layer.cornerRadius = CGFloat.standartCornerRadiusConstant - 4
        view.backgroundColor = StandartColors.shadowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        button.addTarget(self, action: #selector(addSound), for: .touchUpInside)
        button.backgroundColor = StandartColors.thirdButtonColor
        button.titleLabel?.font = .firstSmallButtonFont
        button.setTitleColor(StandartColors.firstTextButtonColor, for: .normal)
        button.layer.borderColor = StandartColors.borderColor.cgColor
        button.layer.borderWidth = CGFloat.borderConstant
        button.layer.cornerRadius = CGFloat.standartCornerRadiusConstant - 4
        button.layer.zPosition = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: System override Functions 
    convenience init(text: String) {
        self.init()
        button.setTitle(text, for: .normal)
        setup()
    }
 
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: CGFloat.buttonSmallHeightConstant),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            shadowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat.shadowIdentConstant),
            shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: CGFloat.shadowIdentConstant)
        ])
    }
    
    //MARK: Personal Functions
    private func setup() {
        [shadowView, button].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func addSound() {
        playSound(name: sound)
    }
}

extension ThirdSmallButton {
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(target, action: action, for: event)
    }
    
    func editText(text: String) {
        button.setTitle(text, for: .normal)
    }
}
