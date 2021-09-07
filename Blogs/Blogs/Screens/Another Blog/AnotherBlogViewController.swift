//
//  AnotherBlogViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class AnotherBlogViewController: UIViewController {
	private let output: AnotherBlogViewOutput

    //MARK: Объявление переменных
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleAnotherBlogScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let titleBlog: Title = {
        let title = Title(text: StandartLanguage.titleBlogAnotherBlogScreen,
                          size: .meb36)
        title.editAligent(aligent: .natural)
        title.sizeToFit()
        return title
    }()
    
    private let text: Text = {
        let text = Text(text: StandartLanguage.textAnotherBlogScreen,
                        size: .mm17)
        text.editAligent(aligent: .natural)
        return text
    }()
    
    private let tagSubtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.tagSubtitleAnotherBlogScreen,
                                size: .meb17)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let tagText: Text = {
        let text = Text(text: StandartLanguage.tagTextAnotherBlogScreen,
                        size: .mm17)
        text.editAligent(aligent: .natural)
        return text
    }()
    
    private let followButton: FirstSmallButton = {
        let button = FirstSmallButton(text: StandartLanguage.followButtonAnotherBlogScreen)
        button.addTarget(self, action: #selector(tapFollowButton))
        button.sizeToFit()
        return button
    }()
    
    private let dateSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.dateSubTitleAnotherBlogScreen,
                                size: .mm15)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let nameSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.nameSubTitleAnotherBlogScreen,
                                size: .mb17)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.smallIconColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let likeIcon: IconImage = {
        let icon = IconImage(icon: .heart, size: .size24)
        icon.addTarget(self, action: #selector(taplikeIcon))
        return icon
    }()
    
    private let shareIcon: IconImage = {
        let icon = IconImage(icon: .share, size: .size24)
        icon.addTarget(self, action: #selector(tapShareIcon))
        return icon
    }()
    
    private let likeSubtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.likeSubtitleAnotherBlogScreen,
                                size: .meb17)
        subtitle.sizeToFit()
        subtitle.editAligent(aligent: .right)
        return subtitle
    }()
    
    private let shareSubtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.shareSubtitleAnotherBlogScreen,
                                size: .meb17)
        return subtitle
    }()
    
    init(output: AnotherBlogViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        [scrollView].forEach{ view.addSubview($0)}
        addSubViewInScrollView()
        
        view.backgroundColor = StandartColors.blogBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func addSubViewInScrollView() {
        let array = [header, titleBlog, text, tagSubtitle,
                     tagText, followButton, nameSubTitle, dateSubTitle,
                     separatorView, shareIcon, shareSubtitle, likeIcon,
                     likeSubtitle]
        array.forEach{ scrollView.addSubview($0)}
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            header.topAnchor.constraint(equalTo: scrollView.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleBlog.topAnchor.constraint(equalTo: header.bottomAnchor),
            titleBlog.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleBlog.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            text.topAnchor.constraint(equalTo: titleBlog.bottomAnchor, constant: 24),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            tagSubtitle.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 12),
            tagSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tagSubtitle.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -24),
            
            tagText.topAnchor.constraint(equalTo: tagSubtitle.bottomAnchor, constant: 5),
            tagText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tagText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            followButton.topAnchor.constraint(equalTo: tagText.bottomAnchor, constant: 12),
            followButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            followButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -36),
            followButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: 24),
            
            nameSubTitle.topAnchor.constraint(equalTo: tagText.bottomAnchor, constant: 12),
            nameSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nameSubTitle.heightAnchor.constraint(equalToConstant: 24),
            nameSubTitle.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -5),
            
            dateSubTitle.heightAnchor.constraint(equalToConstant: 16),
            dateSubTitle.topAnchor.constraint(equalTo: nameSubTitle.bottomAnchor),
            dateSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            dateSubTitle.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -5),
            
            separatorView.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 21),
            separatorView.widthAnchor.constraint(equalToConstant: 2),
            separatorView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 28),

            likeSubtitle.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            likeSubtitle.trailingAnchor.constraint(equalTo: separatorView.leadingAnchor, constant: -12),
            likeSubtitle.heightAnchor.constraint(equalToConstant: 24),
            
            likeIcon.trailingAnchor.constraint(equalTo: likeSubtitle.leadingAnchor, constant: -16),
            likeIcon.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            
            shareIcon.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            shareIcon.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 12),
            
            shareSubtitle.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            shareSubtitle.leadingAnchor.constraint(equalTo: shareIcon.trailingAnchor, constant: 16),
            shareSubtitle.heightAnchor.constraint(equalToConstant: 24),
            shareSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
            
        ])
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapFollowButton() {
        output.didTapFollowButton()
    }
    
    @objc
    private func taplikeIcon() {
        output.didTaplikeIcon()
    }
    
    @objc
    private func tapShareIcon() {
        output.didTapShareIcon()
    }
}

extension AnotherBlogViewController: AnotherBlogViewInput {
}
