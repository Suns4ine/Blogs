//
//  SecondButton.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 26.07.2021.
//

import Foundation
import UIKit

final class SecondBigButton: UIButton {
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = image.image?.tinted(with: StandartColors.secondTextButtonColor)
        image.layer.frame.size = CGSize(width: 24, height: 24)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let viewWithLabelAndIcon: UIView = {
        let view = UIView()
        view.backgroundColor = .firstYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .firstBigButtonFont
        label.textAlignment = .center
        label.textColor = StandartColors.secondTextButtonColor
        label.numberOfLines = 1
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.zPosition = -1
        view.layer.cornerRadius = 16
        view.backgroundColor = StandartColors.shadowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .firstSeaWave
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .firstBigButtonFont
        button.setTitleColor(StandartColors.secondTextButtonColor, for: .normal)
        button.layer.borderColor = StandartColors.borderColor.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 16
        button.layer.zPosition = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    convenience init(text: String, icon: Icons) {
        self.init()
        
        iconImage.image = UIImage(named: choiceIcon(icon: icon))
        label.text = text
        setup()
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [button, shadowView].forEach{ addSubview($0)}
        button.addSubview(viewWithLabelAndIcon)
        [iconImage, label].forEach{ viewWithLabelAndIcon.addSubview($0)}
        
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 60),
            
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            shadowView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4),
            
            viewWithLabelAndIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewWithLabelAndIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            viewWithLabelAndIcon.heightAnchor.constraint(equalToConstant: 28),
            viewWithLabelAndIcon.widthAnchor.constraint(equalToConstant: 93),
            
            iconImage.centerXAnchor.constraint(lessThanOrEqualTo: self.centerXAnchor),
//            iconImage.topAnchor.constraint(equalTo: self.topAnchor),
//            iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
}
