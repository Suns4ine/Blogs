//
//  TwoButtons.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.07.2021.
//

import Foundation
import UIKit

final class TwoButtons: UIView {
    
    //MARK: Create Variable
    private (set) var leadingButton: ThirdBigButton = {
        let button = ThirdBigButton(text: "")
        return button
    }()
    
    private (set) var trailingButton: SecondBigButton = {
        let button = SecondBigButton(text: "", icon: .none)
        return button
    }()
    
    //MARK: System override Functions
    convenience init(stringLeading: String, stringTrailing: String) {
        self.init()
        leadingButton = ThirdBigButton(text: stringLeading)
        trailingButton = SecondBigButton(text: stringTrailing, icon: .none)
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
            self.heightAnchor.constraint(equalToConstant: 60),
            
            leadingButton.topAnchor.constraint(equalTo: self.topAnchor),
            leadingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leadingButton.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -6),
            
            trailingButton.topAnchor.constraint(equalTo: self.topAnchor),
            trailingButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trailingButton.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 6),
        ])
    }
    
    //MARK: Personal Functions
    private func setup() {
        [leadingButton, trailingButton].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension TwoButtons {
    func addLeadingButtonTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        leadingButton.addTarget(target, action: action, for: event)
    }
    
    func addTrailingButtonTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        trailingButton.addTarget(target, action: action, for: event)
    }
    
    func editTextLeadingButton(text: String) {
        leadingButton.editText(text: text)
    }
    
    func editTextTralingButton(text: String) {
        trailingButton.editText(text: text)
    }
}
