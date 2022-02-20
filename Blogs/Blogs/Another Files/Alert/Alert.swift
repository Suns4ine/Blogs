//
//  Alert.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.09.2021.
//

import Foundation
import UIKit

final class Alert: UIView {
    
    private let subTitle: SubTitle = {
        let subtitle = SubTitle(text: "SubTitle", size: .meb17)
        return subtitle
    }()
    
    private let text: Text = {
        let text = Text(text: "Text", size: .mm13)
        return text
    }()
    
    private let cancelButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: "Cancel")
        return button
    }()
    
    //private var arrayButtons: [(String, Selector)] = [("One", )]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [subTitle, text, cancelButton].forEach{ addSubview($0)}
        
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 2
        self.layer.borderColor = StandartColors.borderColor.cgColor
        self.backgroundColor = .thirdYellow
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        
        NSLayoutConstraint.activate([
            
            self.widthAnchor.constraint(equalToConstant: 279),
            
            subTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            text.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 4),
            text.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            text.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            cancelButton.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 13),
            cancelButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            cancelButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            cancelButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18)
        ])
    }
    
    @objc
    private func oneSelector() {
        debugPrint("oneSelector")
    }
    
    @objc
    private func twoSelector() {
        debugPrint("twoSelector")
    }
    
    @objc
    private func threeSelector() {
        debugPrint("threeSelector")
    }
}
