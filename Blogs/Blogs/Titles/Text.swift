//
//  Text.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 28.07.2021.
//

import Foundation
import UIKit

enum SizeText {
    case big
    case standart
    case little
    case small
}

final class Text: UIView, TextProtocol {
    
    private let textView: UITextView = {
        let text = UITextView()
        text.backgroundColor = .clear
        text.textAlignment = .center
        text.font = .firstTextFont
        text.textColor = StandartColors.textColor
        text.sizeToFit()
        text.showsVerticalScrollIndicator = false
        text.showsHorizontalScrollIndicator = false
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        return text
    }()
    
    convenience init(text: String, size: SizeText) {
        self.init()
        
        textView.font = returnFontForTitle(size: size)
        textView.text = text
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
        [textView].forEach{ addSubview($0) }
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func returnFontForTitle(size: SizeText) -> UIFont? {
        
        switch size {
        case .big: return .firstTextFont
        case .standart: return .secondTextFont
        case .little: return .thirdTextFont
        case .small: return .fourthTextFont
        default: return .secondTextFont
            
        }
    }
    
    func editColor(color: UIColor) {
        textView.textColor = color
    }
    
    func editText(text: String) {
        self.textView.text = text
    }
    
    func editAligent(aligent: NSTextAlignment) {
        textView.textAlignment = aligent
    }
    
    func editWorkInText(edit: Bool) {
        textView.isEditable = edit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: self.topAnchor),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
