//
//  FirstSmallButton.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

final class FirstSmallButton: UIView {
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.zPosition = -1
        view.layer.cornerRadius = 12
        view.backgroundColor = StandartColors.shadowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        button.backgroundColor = StandartColors.firstButtonColor
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .firstSmallButtonFont
        button.setTitleColor(StandartColors.firstTextButtonColor, for: .normal)
        button.layer.borderColor = StandartColors.borderColor.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 12
        button.layer.zPosition = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
    
    private func setup() {
        [shadowView, button].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(target, action: action, for: event)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 36),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            shadowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4)
        ])
    }
}
