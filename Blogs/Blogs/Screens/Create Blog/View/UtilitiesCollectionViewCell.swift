//
//  UtilitiesCollectionViewCell.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//

import Foundation
import UIKit

final class UtilitiesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "UtilitiesCollectionViewCell"
    
    private let icon: IconImage = {
        let icon = IconImage(icon: .image, size: .size24)
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [icon].forEach{ addSubview($0) }
        
        self.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            icon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            icon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
