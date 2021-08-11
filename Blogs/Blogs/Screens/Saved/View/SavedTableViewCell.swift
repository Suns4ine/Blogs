//
//  SavedTableViewCell.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//

import Foundation
import UIKit

final class SavedTableViewCell: UITableViewCell {
    
    static let identifier = "SavedTableViewCell"
    
    private let savedView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.blogCellColor
        view.layer.borderColor = StandartColors.borderColor.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.shadowColor
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameSubTitle: SubTitle = {
        let subtitle = SubTitle(text: "nameSubTitle", size: .narrowerLittle)
        subtitle.sizeToFit()
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let dateSubTitle: SubTitle = {
        let subtitle = SubTitle(text: " • dateSubTitle", size: .narrowerLittle)
        subtitle.sizeToFit()
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let title: SubTitle = {
        let title = SubTitle(text: "Title", size: .biggest)
        title.editAligent(aligent: .natural)
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [shadowView, savedView, nameSubTitle, dateSubTitle, title].forEach{ addSubview($0)}
        
        self.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            savedView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            savedView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            savedView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            savedView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            
            shadowView.topAnchor.constraint(equalTo: savedView.topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: savedView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: savedView.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: savedView.bottomAnchor, constant: 4),
            
            nameSubTitle.heightAnchor.constraint(equalToConstant: 16),
            nameSubTitle.topAnchor.constraint(equalTo: savedView.topAnchor, constant: 32),
            nameSubTitle.leadingAnchor.constraint(equalTo: savedView.leadingAnchor, constant: 24),
            nameSubTitle.trailingAnchor.constraint(lessThanOrEqualTo: savedView.centerXAnchor, constant: 12),
            
            dateSubTitle.heightAnchor.constraint(equalToConstant: 16),
            dateSubTitle.centerYAnchor.constraint(equalTo: nameSubTitle.centerYAnchor),
            dateSubTitle.leadingAnchor.constraint(equalTo: nameSubTitle.trailingAnchor),
            dateSubTitle.trailingAnchor.constraint(equalTo: savedView.trailingAnchor, constant: -24),
            
            title.topAnchor.constraint(equalTo: nameSubTitle.bottomAnchor, constant: 8),
            title.bottomAnchor.constraint(lessThanOrEqualTo: savedView.bottomAnchor, constant: -22),
            title.leadingAnchor.constraint(equalTo: savedView.leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(lessThanOrEqualTo: savedView.trailingAnchor, constant: -24)
        ])
    }
}
