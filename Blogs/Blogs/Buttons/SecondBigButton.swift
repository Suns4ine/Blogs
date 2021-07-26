//
//  SecondBigButton.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

final class SecondBigButton: UIButton {
    
    private var hasIcon = false
    private var iconImage: IconImage?
    
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
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.zPosition = -1
        view.layer.cornerRadius = 16
        view.backgroundColor = StandartColors.shadowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        button.backgroundColor = .firstBlack
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .firstBigButtonFont
        button.setTitleColor(StandartColors.secondTextButtonColor, for: .normal)
        button.layer.borderColor = StandartColors.borderColor.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 16
        button.layer.zPosition = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    convenience init(text: String, icon: Icons) {
        self.init()
        
        hasIcon = icon == .none ? false : true
        iconImage = IconImage(icon: icon, size: .small)
        iconImage?.layer.zPosition = 3
        iconImage?.newColorImage(color: label.textColor)
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
    
    private func setup() {
        [shadowView, button, someView, label].forEach{ addSubview($0)}
        if hasIcon { addSubview(iconImage!)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSelector(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(target, action: action, for: event)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 60),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            shadowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4),
        ])
        
        if hasIcon {
            NSLayoutConstraint.activate([
                
                iconImage!.topAnchor.constraint(equalTo: someView.topAnchor),
                iconImage!.leadingAnchor.constraint(equalTo: someView.leadingAnchor),
                iconImage!.centerYAnchor.constraint(equalTo: someView.centerYAnchor),
                
                label.topAnchor.constraint(equalTo: someView.topAnchor),
                label.leadingAnchor.constraint(equalTo: iconImage!.trailingAnchor, constant: 6),
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
}
