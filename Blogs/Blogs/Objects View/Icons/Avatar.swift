//
//  Avatar.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 09.08.2021.
//

import Foundation
import UIKit

enum SizeAvatar: CGFloat {
    case size170 = 170
    case size100 = 100
    case size60 = 60
}

final class Avatar: UIView {
    
    private lazy var avatarViewHeightConstraint: NSLayoutConstraint = self.heightAnchor.constraint(equalToConstant: SizeAvatar.size100.rawValue)
    private lazy var avatarViewWidthConstraint: NSLayoutConstraint  = self.widthAnchor.constraint(equalToConstant: SizeAvatar.size100.rawValue)
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = StandartColors.backgroundAvatarColor
        image.layer.borderColor = StandartColors.titleColor.cgColor
        image.layer.borderWidth = 2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    convenience init(image: UIImage?, size: SizeAvatar) {
        self.init()
        
        if image != nil {
            imageView.image = image
        } else {
            imageView.image =  UIImage(named: "peep-1")
        }
        setup()
        editConstraint(size: size)
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(target, action: action, for: event)
    }
    
    func addTag(_ tag: Int) {
        button.tag = tag
    }
    
    func editImage(image: UIImage) {
        imageView.image = image
    }
    
    private func editConstraint(size: SizeAvatar) {
        switch size {
        case .size170:
            avatarViewWidthConstraint.constant = SizeAvatar.size170.rawValue
            avatarViewHeightConstraint.constant = SizeAvatar.size170.rawValue
        case .size100:
            avatarViewWidthConstraint.constant = SizeAvatar.size100.rawValue
            avatarViewHeightConstraint.constant = SizeAvatar.size100.rawValue
        case .size60:
            avatarViewWidthConstraint.constant = SizeAvatar.size60.rawValue
            avatarViewHeightConstraint.constant = SizeAvatar.size60.rawValue
        default:
            avatarViewWidthConstraint.constant = SizeAvatar.size100.rawValue
            avatarViewHeightConstraint.constant = SizeAvatar.size100.rawValue
        }
        
        imageView.layer.cornerRadius = avatarViewWidthConstraint.constant / 2
        button.layer.cornerRadius = avatarViewWidthConstraint.constant / 2
    }
    
    private func setup() {
        [imageView, button].forEach{ addSubview($0)}
        
        avatarViewHeightConstraint.isActive = true
        avatarViewWidthConstraint.isActive = true
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
