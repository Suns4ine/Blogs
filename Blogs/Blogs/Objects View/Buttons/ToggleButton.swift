//
//  ToggleSwitchButton.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//

import Foundation
import UIKit

final class ToggleButton: UIView {

    //MARK: Create Variable
    private let backgroundOn: UIColor = StandartColors.toggleSwitchOnColor
    private let backgroundOff: UIColor = StandartColors.toggleSwitchOffColor
    
    private var sound: NameSound = .tapButton
    private var flowLeadingConstraint: NSLayoutConstraint?
    private (set) var flag = false
    private (set) var indexPath: IndexPath?

    private lazy var sliderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = StandartColors.circleToggleColor
        button.layer.cornerRadius = CGFloat.toggleButtonHeightConstant/2
        button.layer.borderWidth = CGFloat.borderConstant
        button.layer.borderColor = StandartColors.borderColor.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(newCoordinate), for: .touchUpInside)
        return button
    }()
    
    private lazy var circle: UIView = {
        let view = UIView()
        view.layer.zPosition = 2
        view.layer.borderColor = StandartColors.borderColor.cgColor
        view.layer.borderWidth = CGFloat.borderConstant
        view.layer.cornerRadius = CGFloat.standartCornerRadiusConstant/2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = backgroundOff
        return view
    }()
    
    //MARK: System override Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: CGFloat.toggleButtonHeightConstant),
            self.widthAnchor.constraint(equalToConstant: CGFloat.toggleButtonWidthConstant),
            
            sliderButton.heightAnchor.constraint(equalToConstant: CGFloat.toggleButtonHeightConstant),
            sliderButton.widthAnchor.constraint(equalToConstant: CGFloat.toggleButtonHeightConstant),
            sliderButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            circle.heightAnchor.constraint(equalToConstant: CGFloat.toggleButtonHeightConstant - 20),
            circle.widthAnchor.constraint(equalToConstant: CGFloat.toggleButtonHeightConstant - 20),
            circle.centerYAnchor.constraint(equalTo: sliderButton.centerYAnchor),
            circle.centerXAnchor.constraint(equalTo: sliderButton.centerXAnchor),
        ])
    }
    
    //MARK: Personal Functions
    private func setup() {
        [ circle, sliderButton].forEach{ addSubview($0)}
        firstSetFlag()
        
        self.layer.borderColor = StandartColors.borderColor.cgColor
        self.layer.borderWidth = CGFloat.borderConstant
        self.layer.cornerRadius = CGFloat.toggleButtonHeightConstant/2
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func firstSetFlag() {
        flowLeadingConstraint = sliderButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                      constant: flag ?
                                                                        CGFloat.toggleButtonWidthConstant - CGFloat.toggleButtonHeightConstant : 0)
        flowLeadingConstraint?.isActive = true
        
        circle.backgroundColor = flag ? backgroundOn : backgroundOff
        self.backgroundColor = flag ? backgroundOn : backgroundOff
    }
    
    @objc
    private func newCoordinate() {
        playSound(name: sound)
        
        if flag {
            UIView.animate(withDuration: 0.4,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.flowLeadingConstraint?.constant = 0
                            self.circle.backgroundColor = self.backgroundOff
                            self.flag = false
                            self.layoutIfNeeded()
                                        })

            UIView.animate(withDuration: 0.5,
                           delay: 0.15,
                           options: .allowAnimatedContent,
                           animations: {
                            self.backgroundColor = self.backgroundOff
                            self.layoutIfNeeded()
                                        })
            
        } else {
            UIView.animate(withDuration: 0.4,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.flowLeadingConstraint?.constant = CGFloat.toggleButtonWidthConstant - CGFloat.toggleButtonHeightConstant
                            self.circle.backgroundColor = self.backgroundOn
                            self.flag = true
                            self.layoutIfNeeded()
                                        })
            
            UIView.animate(withDuration: 0.5,
                           delay: 0.15,
                           options: .allowAnimatedContent,
                           animations: {
                            self.backgroundColor = self.backgroundOn
                            self.layoutIfNeeded()
                                        })
        }
    }
}

extension ToggleButton {
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        sliderButton.addTarget(target, action: action, for: event)
    }
    
    func addTag(_ tag: Int) {
        sliderButton.tag = tag
    }
    
    func isOn(bool: Bool) {
        flag = bool
        newCoordinate()
    }
    
    func addIndexPath(index: IndexPath) {
        indexPath = index
    }
}
