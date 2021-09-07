//
//  HeaderView.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.07.2021.
//

import Foundation
import UIKit

final class Header: UIView {
    
    private var leadingSize: CGFloat = 24
    private var tralingSize: CGFloat = 24
    private var text = ""
    
    private let title: Title = {
        let title = Title(text: "Title", size: .meb27)
        title.sizeToFit()
        return title
    }()
    
    private (set) lazy var leftIcon: IconImage = {
        let image = IconImage(icon: .none, size: .size24)
        return image
    }()

    private (set) lazy var rightIcon: IconImage = {
        let image = IconImage(icon: .none, size: .size24)
        return image
    }()
    
    convenience init(title: String, leftIcon: IconImage, rightIcon: IconImage) {
        self.init()
        
        text = title
        sizeTitle(leftIcon: leftIcon, rightIcon: rightIcon)
        self.title.editText(text: title.isEmpty ? " " : title)
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        
        setup()
    }
    
    private func sizeTitle(leftIcon: IconImage, rightIcon: IconImage) {
        
        switch (leftIcon, rightIcon) {
        case (let left, let right) where left.name.isEmpty && right.name.isEmpty:
            leadingSize = 24
            tralingSize = 24
            title.editAligent(aligent: .center)
        case (let left, _) where left.size <= 24 && !left.name.isEmpty:
            leadingSize = left.size + 29
            tralingSize = left.size + 29
            title.editAligent(aligent: .center)
        case (_ , let right) where right.size <= 24  && !right.name.isEmpty:
            leadingSize = right.size + 29
            tralingSize = right.size + 29
            title.editAligent(aligent: .center)
        case (let left, let right) where left.size > 24 && !left.name.isEmpty && right.size > 24 && !right.name.isEmpty :
            leadingSize = left.size + 29
            tralingSize = right.size + 29
            title.editAligent(aligent: .center)
        case(let left, _) where left.size > 24 && !left.name.isEmpty:
            leadingSize = left.size + 29
            tralingSize = 24
            title.editAligent(aligent: .left)
            title.editText(text:  "  " + text)
        case(_, let right) where right.size > 24 && !right.name.isEmpty:
            leadingSize = 24
            tralingSize = right.size + 29
            title.editAligent(aligent: .right)
            title.editText(text: text + "  ")
        default:
            leadingSize = 24
            tralingSize = 24
            title.editAligent(aligent: .center)
        }
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLeftIconTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        leftIcon.addTarget(target, action: action, for: event)
    }

    func addRightIconTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        rightIcon.addTarget(target, action: action, for: event)
    }
    
    func editTitle(text: String) {
        title.editText(text: text)
    }
    
    func editTitleColor(color: UIColor) {
        title.editColor(color: color)
    }
    
    func editAligent(aligent: NSTextAlignment) {
        title.editAligent(aligent: aligent)
    }
    
    private func setup() {
        [title, leftIcon, rightIcon].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 74),
            
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 18),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingSize),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -tralingSize),

            leftIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            leftIcon.centerYAnchor.constraint(equalTo: title.centerYAnchor),

            rightIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            rightIcon.centerYAnchor.constraint(equalTo: title.centerYAnchor)
            
        ])
    }
}
