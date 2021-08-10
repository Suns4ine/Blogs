//
//  SubTitle.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.07.2021.
//

import Foundation
import UIKit

enum SizeSubTitle {
    case big
    case standart
    case widerLittle
    case narrowerLittle
    case small
}

final class SubTitle: UIView, TextProtocol {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .firstTitleFont
        label.textColor = StandartColors.SubTitleColor
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
        case .big: return .firstSubTitleFont
        case .standart: return .secondSubTitleFont
        case .widerLittle: return .thirdSubTitleFont
        case .narrowerLittle: return .fourthSubTitleFont
        case .small: return .fifthSubTitleFont
        default: return .secondSubTitleFont
            
        }
    }
    
    func editColor(color: UIColor) {
        label.textColor = color
    }
    
    func editText(text: String) {
        label.text = text
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
