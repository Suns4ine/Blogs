//
//  HeaderView.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.07.2021.
//

import Foundation
import UIKit

final class Header: UIView {
    
    private let title: Title = {
        let title = Title(text: "Title", size: .meb27)
        return title
    }()
    
    private lazy var leftIcon: IconImage = {
        let image = IconImage(icon: .none, size: .size24)
        return image
    }()

    private lazy var rightIcon: IconImage = {
        let image = IconImage(icon: .none, size: .size24)
        return image
    }()
    
    convenience init(title: String, leftIcon: IconImage, rightIcon: IconImage) {
        self.init()
        
        self.title.editText(text: title.isEmpty ? " " : title)
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        
        setup()
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
            title.widthAnchor.constraint(equalToConstant: self.frame.width -
                                            (48 + leftIcon.frame.width + self.rightIcon.frame.width)),

            leftIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            leftIcon.centerYAnchor.constraint(equalTo: title.centerYAnchor),

            rightIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            rightIcon.centerYAnchor.constraint(equalTo: title.centerYAnchor)
        ])
    }
}
