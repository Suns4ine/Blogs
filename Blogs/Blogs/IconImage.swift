//
//  IconImage.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

enum sizeIcon: CGFloat {
    case finely = 14
    case small = 24
    case standart = 48
    case big = 120
    case biggest = 150
}

final class IconImage: UIView {
    
    private var size: CGFloat = 24
    private var name: String = ""
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    convenience  init(icon: Icons, size: sizeIcon) {
        self.init()
        
        name = choiceIcon(icon: icon)
        image.image = UIImage(named: name)
        image.image = image.image?.tinted(with: returnIconColor(icon: icon, size: size))
        self.size = size.rawValue
        setup()
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        if !name.isEmpty { addSubview(image)}
        [].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: size),
            self.widthAnchor.constraint(equalToConstant: size),
            
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func newColorImage(color: UIColor) {
        image.image = image.image?.tinted(with: color)
    }
}
