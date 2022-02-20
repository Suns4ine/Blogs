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
        
        let path = getDocumentsDirectory().appendingPathComponent(viewModel.user.identifier)
        let image = UIImage(contentsOfFile: path.path) ?? .init()
        
        title.editText(text: viewModel.title)
        nameSubTitle.editText(text: viewModel.nameSubTitle)
        dateSubTitle.editText(text: viewModel.dateSubTitle)
        tagSubTitle.editText(text: viewModel.tagSubTitle)
        avatar.editImage(image: image)
        BlogsTableViewCell.identifier = viewModel.cellIdentifier
    }
    
    static var identifier = "BlogsTableViewCell"
    
    private let blogView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.blogCellColor
        view.layer.cornerRadius = CGFloat.standartCornerRadiusConstant
        view.layer.borderWidth = CGFloat.borderConstant
        view.layer.borderColor = StandartColors.borderColor.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.shadowColor
        view.layer.cornerRadius = CGFloat.standartCornerRadiusConstant
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: nil, size: .size60)
        return avatar
    }()
    
    private let title: Title = {
        let title = Title(text: StandartLanguage.titleBlogCell, size: .meb36)
        title.editAligent(aligent: .natural)
        return title
    }()
    
    private let dateSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.dateSubTitleBlogCell, size: .mm15)
        return subtitle
    }()
    
    private let nameSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.nameSubTitleBlogCell, size: .mb17)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let tagSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.tagSubTitleBlogCell, size: .mm15)
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
        [shadowView, blogView, avatar, title, dateSubTitle, nameSubTitle].forEach{ contentView.addSubview($0)}
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            blogView.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat.standartIdentConstant - 8),
            blogView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -(CGFloat.standartIdentConstant - 8)),
            blogView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat.standartIdentConstant),
            blogView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            
            shadowView.topAnchor.constraint(equalTo: blogView.topAnchor, constant: CGFloat.shadowIdentConstant),
            shadowView.leadingAnchor.constraint(equalTo: blogView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: blogView.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: blogView.bottomAnchor, constant: CGFloat.shadowIdentConstant),
            
            avatar.topAnchor.constraint(equalTo: blogView.topAnchor, constant: CGFloat.standartIdentConstant),
            avatar.leadingAnchor.constraint(equalTo: blogView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            
            dateSubTitle.bottomAnchor.constraint(equalTo: blogView.bottomAnchor, constant: -CGFloat.standartIdentConstant),
            dateSubTitle.leadingAnchor.constraint(equalTo: blogView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            dateSubTitle.heightAnchor.constraint(equalToConstant: CGFloat.subTitleHeight20Constant),
            
            nameSubTitle.bottomAnchor.constraint(equalTo: dateSubTitle.topAnchor),
            nameSubTitle.leadingAnchor.constraint(equalTo: blogView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            nameSubTitle.heightAnchor.constraint(equalToConstant: CGFloat.standartIdentConstant),
            nameSubTitle.trailingAnchor.constraint(equalTo: blogView.trailingAnchor,
                                                   constant: -(CGFloat.standartIdentConstant * 2)),
            
            title.topAnchor.constraint(equalTo: blogView.topAnchor, constant: CGFloat.titleBlogCellIdentConstant),
            title.leadingAnchor.constraint(equalTo: blogView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            title.trailingAnchor.constraint(lessThanOrEqualTo: blogView.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            title.bottomAnchor.constraint(lessThanOrEqualTo: nameSubTitle.topAnchor, constant: -CGFloat.standartIdentConstant/2),
            
//            tagSubTitle.bottomAnchor.constraint(equalTo: blogView.bottomAnchor, constant: -24),
//            tagSubTitle.trailingAnchor.constraint(equalTo: blogView.trailingAnchor, constant: -24),
//            tagSubTitle.leadingAnchor.constraint(lessThanOrEqualTo: dateSubTitle.trailingAnchor, constant: 16),
//            tagSubTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func addTargetAvatar(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        avatar.addTarget(target, action: action, for: event)
    }
    
    func addTag(_ tag: Int) {
        avatar.addTag(tag)
    }
}
