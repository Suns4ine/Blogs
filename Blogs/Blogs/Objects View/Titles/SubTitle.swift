//
//  SubTitle.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.07.2021.
//

import Foundation
import UIKit

enum SizeSubTitle {
    case meb24
    case meb21
    case mb21
    case meb17
    case mb17
    case mm15
    case meb12
    case mm21
}

final class SubTitle: UIView, TextProtocol {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .firstTitleFont
        label.textColor = StandartColors.subTitleColor
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    convenience init(text: String, size: SizeSubTitle) {
        self.init()
        
        label.font = returnFontForTitle(size: size)
        label.text = text
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
        [label].forEach{ addSubview($0) }
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func returnFontForTitle(size: SizeSubTitle) -> UIFont? {
        
        switch size {
        case .meb24: return .firstSubTitleFont
        case .meb21: return .secondSubTitleFont
        case .meb17: return .thirdSubTitleFont
        case .mb17: return .fourthSubTitleFont
        case .mm15: return .fifthSubTitleFont
        case .meb12: return .sixthSubTitleFont
        case .mb21: return .seventhSubTitleFont
        case .mm21: return .eighthSubTitleFont
        default: return .secondSubTitleFont
            
        }
    }
    
    func editColor(color: UIColor) {
        label.textColor = color
    }
    
    func editText(text: String) {
        label.text = text
    }
    
    func editAligent(aligent: NSTextAlignment) {
        label.textAlignment = aligent
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
