//
//  FirstTitle.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 27.07.2021.
//

import Foundation
import UIKit

enum SizeTitle {
    case meb36
    case meb27
    case meb24
}

final class Title: UIView, TextProtocol {
    
    //MARK: Create Variable
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .firstTitleFont
        label.textColor = StandartColors.titleColor
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: System override Functions
    convenience init(text: String, size: SizeTitle) {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    //MARK: Personal Functions
    private func setup() {
        [label].forEach{ addSubview($0) }
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func returnFontForTitle(size: SizeTitle) -> UIFont? {
        switch size {
        case .meb36: return .firstTitleFont
        case .meb27: return .secondTitleFont
        case .meb24: return .thirdTitleFont
        default: return .secondTitleFont
        }
    }
}

extension Title {
    func editColor(color: UIColor) {
        label.textColor = color
    }
    
    func editText(text: String) {
        label.text = text
    }
    
    func editAligent(aligent: NSTextAlignment) {
        label.textAlignment = aligent
    }
}
