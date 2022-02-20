//
//  Text.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 28.07.2021.
//

import Foundation
import UIKit

enum SizeText {
    case mm21
    case mm17
    case mm15
    case mm13
}

final class Text: UIView, TextProtocol, UITextViewDelegate {
    
    //MARK: Create Variable
    private (set) lazy var textView: UITextView = {
        let text = UITextView()
        text.tintColor = StandartColors.highlightTextColor
        text.backgroundColor = .clear
        text.textAlignment = .center
        text.font = .firstTextFont
        text.textColor = StandartColors.textColor
        text.showsVerticalScrollIndicator = false
        text.showsHorizontalScrollIndicator = false
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isEditable = false
        text.isScrollEnabled = false
        text.delegate = self
        return text
    }()
    
    //MARK: System override Functions
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text.last == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
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
    
    //MARK: Personal Functions
    private func setup() {
        [textView].forEach{ addSubview($0) }
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func returnFontForTitle(size: SizeText) -> UIFont? {
        switch size {
        case .mm21: return .firstTextFont
        case .mm17: return .secondTextFont
        case .mm15: return .thirdTextFont
        case .mm13: return .fourthTextFont
        default: return .secondTextFont
        }
    }
}

extension Text {
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
    
    func editScrollEnabled(edit: Bool) {
        textView.isScrollEnabled = edit
    }
    
    func editShowsVerticalScrollIndicator(edit: Bool) {
        textView.showsVerticalScrollIndicator = edit
    }
}
