//
//  RefreshControl.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 02.09.2021.
//

import Foundation
import UIKit

final class RefreshControl: UIRefreshControl {
    
    private let size: CGFloat = 60
    private var indent: CGFloat = 0
    
    private let updateIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo-mark")
        return view
    }()
    
    private lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = StandartColors.shadowColor
        view.layer.cornerRadius = (size)/2
        return view
    }()
    
    convenience init(indent: CGFloat = 0) {
        self.init()
        
        self.indent = indent
    }
    
    private override init() {
        super.init()
        
        setup()
    }
    
    private func setup () {
        
        [shadowView, updateIcon].forEach{ self.addSubview($0)}
        
        self.tintColor = .clear
        self.backgroundColor = .clear
        self.attributedTitle = NSAttributedString(string: StandartLanguage.refreshControlAnotherMoreBlogsScreen)
        startAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            updateIcon.heightAnchor.constraint(equalToConstant: size),
            updateIcon.widthAnchor.constraint(equalToConstant: size),
            updateIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            updateIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: indent),
            
            
            shadowView.topAnchor.constraint(equalTo: updateIcon.topAnchor, constant: 4),
            shadowView.leadingAnchor.constraint(equalTo: updateIcon.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: updateIcon.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: updateIcon.bottomAnchor, constant: 4),
            
//            shadowView.heightAnchor.constraint(equalToConstant: size),
//            shadowView.widthAnchor.constraint(equalToConstant: size),
//            shadowView.centerXAnchor.constraint(equalTo: updateIcon.centerXAnchor),
//            shadowView.centerYAnchor.constraint(equalTo: updateIcon.centerYAnchor, constant: indent + 4),
        ])
    }
    
    func startAnimation() {
        updateIcon.rotate(duration: 1.2)
    }
    
    func endAnimation() {
        updateIcon.stopRotating()
    }
}
