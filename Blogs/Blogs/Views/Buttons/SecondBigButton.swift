//
//  SecondBigButton.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

final class SecondBigButton: UIView {
    
    //MARK: Create Variable
    private var hasIcon = false
    private (set) var indexPath: IndexPath?
    private var sound: NameSound = .tapButton
    
    private lazy var iconImage: IconImage = {
        let image = IconImage(icon: .none, size: .size24)
        image.layer.zPosition = 3
        image.editColor(color: label.textColor)
        return image
    }()
    
    private let someView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.layer.zPosition = 3
        label.backgroundColor = .clear
        label.font = .firstBigButtonFont
        label.textAlignment = .center
        label.textColor = StandartColors.secondTextButtonColor
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.zPosition = -1
        view.layer.cornerRadius = CGFloat.standartCornerRadiusConstant
        view.backgroundColor = StandartColors.shadowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        button.addTarget(self, action: #selector(addSound), for: .touchUpInside)
        button.backgroundColor = StandartColors.secondButtonColor
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .firstBigButtonFont
        button.setTitleColor(StandartColors.secondTextButtonColor, for: .normal)
        button.layer.borderColor = StandartColors.borderColor.cgColor
        button.layer.borderWidth = CGFloat.borderConstant
        button.layer.cornerRadius = CGFloat.standartCornerRadiusConstant
        button.layer.zPosition = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: System override Functions
    convenience init(text: String, icon: Icons) {
        self.init()
        
        hasIcon = icon == .none ? false : true
        iconImage = IconImage(icon: icon, size: .size24)
        iconImage.layer.zPosition = 3
        iconImage.editColor(color: label.textColor)
        label.text = text
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
            self.heightAnchor.constraint(equalToConstant: CGFloat.buttonBigHeightConstant),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            shadowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat.shadowIdentConstant),
            shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: CGFloat.shadowIdentConstant),
        ])
        
        if hasIcon {
            NSLayoutConstraint.activate([
                iconImage.topAnchor.constraint(equalTo: someView.topAnchor),
                iconImage.leadingAnchor.constraint(equalTo: someView.leadingAnchor),
                iconImage.centerYAnchor.constraint(equalTo: someView.centerYAnchor),
                
                label.topAnchor.constraint(equalTo: someView.topAnchor),
                label.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: CGFloat.minimumIdentConstant + 1),
                label.centerYAnchor.constraint(equalTo: someView.centerYAnchor),
                
                someView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                someView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                someView.widthAnchor.constraint(equalToConstant: label.frame.size.width + 30),
            ])
        } else {
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
        }
    }
    
    //MARK: Personal Functions
    private func setup() {
        if hasIcon { addSubview(iconImage)}
        [shadowView,  someView, label, button].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func addSound() {
        playSound(name: sound)
    }
}

extension SecondBigButton {
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(target, action: action, for: event)
    }
    
    func editColor(color: UIColor) {
        button.backgroundColor = color
    }
    
    func editText(text: String) {
        label.text = text
    }
    
    func addTag(_ tag: Int) {
        button.tag = tag
    }
    
    func addIndexPath(index: IndexPath) {
        indexPath = index
    }
}