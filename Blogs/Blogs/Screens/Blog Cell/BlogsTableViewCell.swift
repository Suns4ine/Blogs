//
//  BlogsTableViewCell.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//

import Foundation
import UIKit

final class BlogsTableViewCell: UITableViewCell, BlogCellModelRepresentable {
    var viewModel: BlogCellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let viewModel = viewModel as? BlogCellViewModel else { return }
        title.editText(text: viewModel.title)
        nameSubTitle.editText(text: viewModel.nameSubTitle)
        dateSubTitle.editText(text: viewModel.dateSubTitle)
        tagSubTitle.editText(text: viewModel.tagSubTitle)
        avatar.editImage(image: viewModel.user.avatar)
        BlogsTableViewCell.identifier = viewModel.cellIdentifier
    }
    
    static var identifier = "BlogsTableViewCell"
    
    private let blogView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.blogCellColor
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = StandartColors.borderColor.cgColor
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
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: nil, size: .size60)
        return avatar
    }()
    
    private let title: Title = {
        let title = Title(text: "Title Blog", size: .meb36)
        title.editAligent(aligent: .natural)
        return title
    }()
    
    private let dateSubTitle: SubTitle = {
        let subtitle = SubTitle(text: "dateSubTitle", size: .mm15)
        subtitle.sizeToFit()
        return subtitle
    }()
    
    private let nameSubTitle: SubTitle = {
        let subtitle = SubTitle(text: "nameSubTitle", size: .mb17)
        subtitle.sizeToFit()
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let tagSubTitle: SubTitle = {
        let subtitle = SubTitle(text: "tagSubTitle ", size: .mm15)
        subtitle.sizeToFit()
        subtitle.editAligent(aligent: .right)
        return subtitle
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [shadowView, blogView, avatar, title, dateSubTitle, nameSubTitle, tagSubTitle].forEach{ contentView.addSubview($0)}
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            blogView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            blogView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            blogView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            blogView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            shadowView.topAnchor.constraint(equalTo: blogView.topAnchor, constant: 4),
            shadowView.leadingAnchor.constraint(equalTo: blogView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: blogView.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: blogView.bottomAnchor, constant: 4),
            
            avatar.topAnchor.constraint(equalTo: blogView.topAnchor, constant: 24),
            avatar.leadingAnchor.constraint(equalTo: blogView.leadingAnchor, constant: 24),
            
            dateSubTitle.bottomAnchor.constraint(equalTo: blogView.bottomAnchor, constant: -24),
            dateSubTitle.leadingAnchor.constraint(equalTo: blogView.leadingAnchor, constant: 24),
            
            nameSubTitle.bottomAnchor.constraint(equalTo: dateSubTitle.topAnchor),
            nameSubTitle.leadingAnchor.constraint(equalTo: blogView.leadingAnchor, constant: 24),
            nameSubTitle.heightAnchor.constraint(equalToConstant: 24),
            nameSubTitle.trailingAnchor.constraint(equalTo: blogView.trailingAnchor, constant: -48),
            
            title.topAnchor.constraint(equalTo: blogView.topAnchor, constant: 108),
            title.leadingAnchor.constraint(equalTo: blogView.leadingAnchor, constant: 24),
            title.trailingAnchor.constraint(lessThanOrEqualTo: blogView.trailingAnchor, constant: -24),
            title.bottomAnchor.constraint(lessThanOrEqualTo: nameSubTitle.topAnchor, constant: -12),
            
            tagSubTitle.bottomAnchor.constraint(equalTo: blogView.bottomAnchor, constant: -24),
            tagSubTitle.trailingAnchor.constraint(equalTo: blogView.trailingAnchor, constant: -24),
            tagSubTitle.leadingAnchor.constraint(equalTo: dateSubTitle.trailingAnchor, constant: 16),
            tagSubTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func addTargetAvatar(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        avatar.addTarget(target, action: action, for: event)
    }
    
    func addTag(_ tag: Int) {
        avatar.addTag(tag)
    }
}
