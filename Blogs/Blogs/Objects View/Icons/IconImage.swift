//
//  IconImage.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

enum sizeIcon: CGFloat {
    case size14 = 14
    case size24 = 24
    case size48 = 48
    case size120 = 120
    case size150 = 150
}

final class IconImage: UIView {
    
    private (set) var size: CGFloat = 24
    private (set) var name: String = ""
    private var constShadow: CGFloat = 2
    
    private var clickAreaButton: CGFloat = 0
    
    private let shadowIconArray: [Icons] = [.fill1, .fill2, .fill3, .outline1, .outline2, .outline3, .logo]
    private let exceptionsIconArray: [Icons] = [.fill1, .fill2, .fill3, .outline1, .outline2,
                                                .outline3, .logo, .facebook, .twitter, .heartFill]
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(addSound), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = StandartColors.shadowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    convenience  init(icon: Icons, size: sizeIcon) {
        self.init()
        
        constShadow = size.rawValue > 24 ? 4 : constShadow
        shadowView.isHidden = shadowIconArray.contains(icon) ? false : true
        shadowView.layer.cornerRadius = size.rawValue/2
        name = icon.rawValue
        image.image = UIImage(named: name)
        self.size = size.rawValue
        setup()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        if !name.isEmpty {
            [shadowView, image, button].forEach{ addSubview($0)}
        }
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func addSound() {
        playSound(name: .tapButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: size),
            self.widthAnchor.constraint(equalToConstant: size),
        ])
        
        if !name.isEmpty {
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: self.topAnchor),
                image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                
                button.topAnchor.constraint(equalTo: self.topAnchor, constant: -clickAreaButton),
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -clickAreaButton),
                button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: clickAreaButton),
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: clickAreaButton),
                
                shadowView.topAnchor.constraint(equalTo: image.topAnchor, constant: 2),
                shadowView.leadingAnchor.constraint(equalTo: image.leadingAnchor),
                shadowView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
                shadowView.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: 2)
            ])
        }
    }
}

extension IconImage {
    
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(target, action: action, for: event)
    }
    
    func addTag(_ tag: Int) {
        button.tag = tag
    }
    
    func editIcon(icon: Icons) {
        image.image = UIImage(named: icon.rawValue)
    }
    
    func editColor(color: UIColor) {
        image.image = image.image?.tinted(with: color)
    }
}
