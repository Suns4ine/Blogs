//
//  BlogViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 05.09.2021.
//  
//

import UIKit
import PDFKit

final class BlogViewController: UIViewController {
	private let output: BlogViewOutput
    
    //MARK: Create Variable
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitlteMyBlogScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let titleBlog: Title = {
        let title = Title(text: StandartLanguage.titleBlogMyBlogScreen,
            size: .meb36)
        title.editAligent(aligent: .natural)
        title.sizeToFit()
        return title
    }()
    
    private let text: Text = {
        let text = Text(text: StandartLanguage.textMyBlogScreen,
                        size: .mm17)
        text.editAligent(aligent: .natural)
        return text
    }()
    
    private let tagSubtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.tagSubtitleMyBlogScreen,
                                size: .meb17)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let tagText: Text = {
        let text = Text(text: StandartLanguage.tagTextMyBlogScreen,
                        size: .mm17)
        text.editAligent(aligent: .natural)
        return text
    }()
    
    private let editButton: FirstSmallButton = {
        let button = FirstSmallButton(text: StandartLanguage.editButtonMyBlogScreen)
        button.addTarget(self, action: #selector(tapEditButton))
        button.sizeToFit()
        button.isHidden = true
        return button
    }()
    
    private let followButton: FirstSmallButton = {
        let button = FirstSmallButton(text: StandartLanguage.followButtonAnotherBlogScreen)
        button.addTarget(self, action: #selector(tapFollowButton))
        button.sizeToFit()
        button.isHidden = true
        return button
    }()
    
    private let dateSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.dateSubTitleMyBlogScreen,
                                size: .mm15)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let nameSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.nameSubTitleMyBlogScreen,
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
        let subtitle = SubTitle(text: StandartLanguage.likeSubtitleMyBlogScreen,
                                size: .meb17)
        subtitle.sizeToFit()
        subtitle.editAligent(aligent: .right)
        return subtitle
    }()
    
    private let shareSubtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.shareSubtitleMyBlogScreen,
                                size: .meb17)
        return subtitle
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapProfileButton), for: .touchUpInside)
        return button
    }()

    //MARK: System override Functions
    init(output: BlogViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        output.setupTextInViews()
        output.statusSubscribe()
        output.statusLike()
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        addSubViewInView()
        addLayoutSubviews()
        
        view.backgroundColor = StandartColors.blogBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    //MARK: Personal Functions
    private func addLayoutSubviews() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            header.topAnchor.constraint(equalTo: scrollView.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleBlog.topAnchor.constraint(equalTo: header.bottomAnchor),
            titleBlog.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            titleBlog.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            
            text.topAnchor.constraint(equalTo: titleBlog.bottomAnchor, constant:  CGFloat.standartIdentConstant),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  CGFloat.standartIdentConstant),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            
            tagSubtitle.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: CGFloat.standartIdentConstant/2),
            tagSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            tagSubtitle.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            
            tagText.topAnchor.constraint(equalTo: tagSubtitle.bottomAnchor, constant: CGFloat.minimumIdentConstant),
            tagText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            tagText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            
            editButton.topAnchor.constraint(equalTo: tagText.bottomAnchor, constant: CGFloat.standartIdentConstant/2),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            editButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -CGFloat.standartIdentConstant * 1.5),
            editButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: CGFloat.standartIdentConstant),
            
            followButton.topAnchor.constraint(equalTo: tagText.bottomAnchor, constant: CGFloat.standartIdentConstant/2),
            followButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            followButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -CGFloat.standartIdentConstant * 1.5),
            followButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: CGFloat.standartIdentConstant),
            
            nameSubTitle.topAnchor.constraint(equalTo: tagText.bottomAnchor, constant: CGFloat.standartIdentConstant/2),
            nameSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            nameSubTitle.heightAnchor.constraint(equalToConstant: CGFloat.nameSubtitleHeightConstant),
            nameSubTitle.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -CGFloat.minimumIdentConstant),
            
            profileButton.topAnchor.constraint(equalTo: nameSubTitle.topAnchor),
            profileButton.leadingAnchor.constraint(equalTo: nameSubTitle.leadingAnchor),
            profileButton.trailingAnchor.constraint(equalTo: nameSubTitle.trailingAnchor),
            profileButton.bottomAnchor.constraint(equalTo: profileButton.bottomAnchor),
            
            dateSubTitle.heightAnchor.constraint(equalToConstant: CGFloat.dateSubtitleHeightConstant),
            dateSubTitle.topAnchor.constraint(equalTo: nameSubTitle.bottomAnchor),
            dateSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            dateSubTitle.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -CGFloat.minimumIdentConstant),
            
            separatorView.topAnchor.constraint(equalTo: text.bottomAnchor, constant: CGFloat.standartIdentConstant - 3),
            separatorView.widthAnchor.constraint(equalToConstant: CGFloat.borderConstant),
            separatorView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: sizeIcon.size24.rawValue + 4),

            likeSubtitle.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            likeSubtitle.trailingAnchor.constraint(equalTo: separatorView.leadingAnchor,
                                                   constant: -CGFloat.standartIdentConstant/2),
            likeSubtitle.heightAnchor.constraint(equalToConstant: sizeIcon.size24.rawValue),
            
            likeIcon.trailingAnchor.constraint(equalTo: likeSubtitle.leadingAnchor,
                                               constant: -(CGFloat.standartIdentConstant/2 + 4)),
            likeIcon.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            
            shareIcon.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            shareIcon.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: CGFloat.standartIdentConstant/2),
            
            shareSubtitle.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
            shareSubtitle.leadingAnchor.constraint(equalTo: shareIcon.trailingAnchor,
                                                   constant: CGFloat.standartIdentConstant/2 + 4),
            shareSubtitle.heightAnchor.constraint(equalToConstant: sizeIcon.size24.rawValue),
            shareSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant/2)
        ])
    }
    
    private func addSubViewInView() {
        let array = [header, titleBlog, text, tagSubtitle,
                     tagText, editButton, nameSubTitle, dateSubTitle,
                     separatorView, shareIcon, shareSubtitle, likeIcon,
                     likeSubtitle, followButton, profileButton]
        [scrollView].forEach{ view.addSubview($0)}
        array.forEach{ scrollView.addSubview($0)}
    }
    
    @objc
    private func tapProfileButton() {
       // output.didTapProfile()
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapEditButton() {
        output.didTapEditButton()
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

extension BlogViewController: BlogViewInput {
    
    //Обновляем статус кнопки like (красим ее или нет)
    func showLike(isOn: Bool) {
        if isOn {
            likeIcon.editIcon(icon: .heartFill)
            likeIcon.editColor(color: StandartColors.filledHeartColor)
        } else {
            likeIcon.editIcon(icon: .heart)
            likeIcon.editColor(color: StandartColors.emptyHeartColor)
        }
    }
    
    //Делимся данными через activityViewController
    func shareData(cartage: (String, String)) {
        
        
        //Хотел сначала делиться пдф, но с ней вышло как-то не очень (урезается или не показывается весь контент scroll view)
        let title = cartage.0
        let text = title + "\n" + cartage.1
       //var data = generatePDFdata(withView: scrollView)
        
        let activityViewController = UIActivityViewController(activityItems: [text] , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func showStatus(text: String) {
        followButton.editText(text: text)
    }
    
    func showName(text: String) {
        nameSubTitle.editText(text: text)
    }
    
    func showTitle(text: String) {
        titleBlog.editText(text: text)
    }
    
    func showText(text: String) {
        self.text.editText(text: text)
    }
    
    func showTags(text: String) {
        tagText.editText(text: text)
    }
    
    func showDate(text: String) {
        dateSubTitle.editText(text: text)
    }
    
    func setupViewMyBlog() {
        //followButton.isHidden = true
        //editButton.isHidden = false
    }
    
    func setupViewAnotherBlog() {
        //editButton.isHidden = true
        //followButton.isHidden = false
    }

}
