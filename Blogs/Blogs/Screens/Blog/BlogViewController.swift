//
//  BlogViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 05.09.2021.
//  
//

import UIKit

final class BlogViewController: UIViewController {
	private let output: BlogViewOutput
    
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
        [scrollView].forEach{ view.addSubview($0)}
        addSubViewInScrollView()
        
        view.backgroundColor = StandartColors.blogBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    private func addSubViewInScrollView() {
        let array = [header, titleBlog, text, tagSubtitle,
                     tagText, editButton, nameSubTitle, dateSubTitle,
                     separatorView, shareIcon, shareSubtitle, likeIcon,
                     likeSubtitle, followButton]
        
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
            
            editButton.topAnchor.constraint(equalTo: tagText.bottomAnchor, constant: 12),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            editButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -36),
            editButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: 24),
            
            followButton.topAnchor.constraint(equalTo: tagText.bottomAnchor, constant: 12),
            followButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            followButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -36),
            followButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: 24),
            
            nameSubTitle.topAnchor.constraint(equalTo: tagText.bottomAnchor, constant: 12),
            nameSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nameSubTitle.heightAnchor.constraint(equalToConstant: 24),
            nameSubTitle.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -5),
            
            dateSubTitle.heightAnchor.constraint(equalToConstant: 16),
            dateSubTitle.topAnchor.constraint(equalTo: nameSubTitle.bottomAnchor),
            dateSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            dateSubTitle.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -5),
            
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
    func showLike(isOn: Bool) {
        if isOn {
            likeIcon.editIcon(icon: .heartFill)
            likeIcon.editColor(color: StandartColors.filledHeartColor)
        } else {
            likeIcon.editIcon(icon: .heart)
            likeIcon.editColor(color: StandartColors.emptyHeartColor)
        }
    }
    
    func shareData(cartage: (String, String)) {
        
        let text = cartage.0
        
        let vc = UIActivityViewController(activityItems: [text], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
        followButton.isHidden = true
        editButton.isHidden = false
    }
    
    func setupViewAnotherBlog() {
        editButton.isHidden = true
        followButton.isHidden = false
    }

}

class MyActivity: UIActivity {
    
    override var activityTitle: String? { "Жми сюда" }
    override var activityImage: UIImage? { UIImage(named: "icon") }
    override var activityType: UIActivity.ActivityType? { .none }
    override class var activityCategory: UIActivity.Category { .share }
    
    override var activityViewController: UIViewController? {
        let text = "Спасибо за регистрацию на сайти JoyCasino.com"
        let alertController = UIAlertController(title: text, message: nil, preferredStyle: .alert)
        let thankAction = UIAlertAction(title: "Не за что", style: .default) { [weak self] _ in
            self?.activityDidFinish(true)
        }
        alertController.addAction(thankAction)
        return alertController
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool { true }
}
