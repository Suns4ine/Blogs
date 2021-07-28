//
//  TwoButtons.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.07.2021.
//

import Foundation
import UIKit

final class TwoButtons: UIView {
    
    private var leadingButton: ThirdBigButton = {
        let button = ThirdBigButton(text: "")
        return button
    }()
    
    private (set) var trailingButton: SecondBigButton = {
        let button = SecondBigButton(text: "", icon: .none)
        return button
    }()
    
    convenience init(stringLeading: String, stringTrailing: String) {
        self.init()
        
        leadingButton = ThirdBigButton(text: stringLeading)
        trailingButton = SecondBigButton(text: stringTrailing, icon: .none)
        
        setup()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [leadingButton, trailingButton].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addLeadingButtonSelector(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        leadingButton.addSelector(target, action: action, for: event)
    }
    
    func addTrailingButtonSelector(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        trailingButton.addSelector(target, action: action, for: event)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 108),
            
            leadingButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            leadingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            leadingButton.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -6),
            
            trailingButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            trailingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            trailingButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 6),
        ])
    }
}
