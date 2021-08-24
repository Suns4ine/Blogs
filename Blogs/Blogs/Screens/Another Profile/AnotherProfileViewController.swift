//
//  AnotherProfileViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class AnotherProfileViewController: UIViewController {
	private let output: AnotherProfileViewOutput

    //MARK: Объявление переменных
    private var arrayBlogs: [String] = ["", "", "", "", "", ""] {
        didSet {
            emptyTitle.isHidden = arrayBlogs.isEmpty ? false : true
            moreBlogButton.isHidden = arrayBlogs.count > 5 ? false : true
        }
    }
    
    private lazy var heightBlogTableView: CGFloat = CGFloat(arrayBlogs.count > 5 ? 5 * 168 : arrayBlogs.count * 168)
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private let header: Header = {
        let header = Header(title: "",
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let profileView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.anotherProfileColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: nil, size: .size170)
        return avatar
    }()
    
    private let nameTitle: Title = {
        let title = Title(text: "Name and Surname Title", size: .meb36)
        title.editColor(color: StandartColors.anotherTitleColor)
        return title
    }()
    
    private let nameTagSubtitle: SubTitle = {
        let subtitle = SubTitle(text: "nameTagSubtitle", size: .mm15)
        subtitle.editColor(color: StandartColors.anotherSubTitleColor)
        return subtitle
    }()
    
    private let followButton: ThirdBigButton = {
        let button = ThirdBigButton(text: "followButton")
        button.addTarget(self, action: #selector(tapFollowButton))
        return button
    }()
    
    private let statisticView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let aboutAnotherSubTitle: SubTitle = {
        let subtitle = SubTitle(text: "aboutAnotherSubTitle", size: .mb21)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()

    private let aboutAnotherText: Text = {
        let text = Text(text: "aboutAnotherText Wireframe is still important for ideation. It will help you to quickly test idea.",
                        size: .mm15)
        text.editAligent(aligent: .natural)
        return text
    }()
    
    private let anotherBlogsSubTitle: SubTitle = {
        let subtitle = SubTitle(text: "anotherBlogsSubTitle", size: .mb21)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let emptyTitle: Title = {
        let title = Title(text: "Another Profile doesn't have blogs yet. If they appear, they will lie here.",
                          size: .meb27)
        return title
    }()
    
    private let blogTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.sizeToFit()
        return table
    }()
    
    private let moreBlogButton: SecondBigButton = {
        let button = SecondBigButton(text: "moreBlogButton", icon: .none)
        button.addTarget(self, action: #selector(tapMoreBlogButton))
        return button
    }()
    
    private let extraProfileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = StandartColors.anotherProfileColor
        return view
    }()
    
    private let numberBlogTitle: SubTitle = {
        let title = SubTitle(text: "123456", size: .meb24)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private let numberBlogNameTitle: SubTitle = {
        let title = SubTitle(text: "blogs", size: .mm15)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private let followersBlogTitle: SubTitle = {
        let title = SubTitle(text: "123456", size: .meb24)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()

    private let followersBlogNameTitle: SubTitle = {
        let title = SubTitle(text: "followers", size: .mm15)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private let follovingBlogTitle: SubTitle = {
        let title = SubTitle(text: "123456", size: .meb24)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private let follovingBlogNameTitle: SubTitle = {
        let title = SubTitle(text: "folloving", size: .mm15)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private func addSubViewInScrollView() {
        let array = [ profileView, avatar, header, nameTitle, nameTagSubtitle,
                      followButton, statisticView, aboutAnotherSubTitle, aboutAnotherText,
                      anotherBlogsSubTitle, emptyTitle, blogTableView, moreBlogButton,
                      numberBlogTitle, followersBlogTitle, follovingBlogTitle, numberBlogNameTitle,
                      followersBlogNameTitle, follovingBlogNameTitle]
        
        array.forEach{ scrollView.addSubview($0)}
    }
    
    init(output: AnotherProfileViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        [extraProfileView, scrollView].forEach{ view.addSubview($0)}
        addSubViewInScrollView()
        
        scrollView.delegate =  self
        blogTableView.delegate = self
        blogTableView.dataSource = self
        blogTableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        
        self.view.backgroundColor = StandartColors.standartBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        emptyTitle.isHidden = arrayBlogs.isEmpty ? false : true
        moreBlogButton.isHidden = arrayBlogs.count > 5 ? false : true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            avatar.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25.5),
            
            header.topAnchor.constraint(equalTo: scrollView.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            extraProfileView.topAnchor.constraint(equalTo: view.topAnchor),
            extraProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            extraProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            extraProfileView.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10),

            nameTitle.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 21),
            nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            nameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            nameTitle.heightAnchor.constraint(lessThanOrEqualToConstant: 88),
            
            nameTagSubtitle.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 7),
            nameTagSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            nameTagSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            nameTagSubtitle.heightAnchor.constraint(equalToConstant: 24),
            
            followButton.topAnchor.constraint(equalTo: nameTagSubtitle.bottomAnchor, constant: 24),
            followButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            followButton.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 44),
            followButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -44),
            
            statisticView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 32),
            statisticView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            statisticView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            statisticView.heightAnchor.constraint(equalToConstant: 60),
            
            profileView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: statisticView.bottomAnchor, constant: 36),
            
            followersBlogTitle.topAnchor.constraint(equalTo: statisticView.topAnchor),
            followersBlogTitle.centerXAnchor.constraint(equalTo: statisticView.centerXAnchor),
            followersBlogTitle.widthAnchor.constraint(equalToConstant: statisticView.frame.width/3 - 6),
            followersBlogTitle.heightAnchor.constraint(equalToConstant: statisticView.frame.height/2 - 4),
            
            followersBlogNameTitle.topAnchor.constraint(equalTo: followersBlogTitle.bottomAnchor, constant: 8),
            followersBlogNameTitle.centerXAnchor.constraint(equalTo: followersBlogTitle.centerXAnchor),
            followersBlogNameTitle.widthAnchor.constraint(equalToConstant: statisticView.frame.width/3 - 6),
            followersBlogNameTitle.heightAnchor.constraint(equalToConstant: statisticView.frame.height/2 - 4),

            numberBlogTitle.topAnchor.constraint(equalTo: statisticView.topAnchor),
            numberBlogTitle.leadingAnchor.constraint(equalTo: statisticView.leadingAnchor),
            numberBlogTitle.widthAnchor.constraint(equalToConstant: statisticView.frame.width/3 - 6),
            numberBlogTitle.heightAnchor.constraint(equalToConstant: statisticView.frame.height/2 - 4),
            
            numberBlogNameTitle.topAnchor.constraint(equalTo: numberBlogTitle.bottomAnchor, constant: 8),
            numberBlogNameTitle.centerXAnchor.constraint(equalTo: numberBlogTitle.centerXAnchor),
            numberBlogNameTitle.widthAnchor.constraint(equalToConstant: statisticView.frame.width/3 - 6),
            numberBlogNameTitle.heightAnchor.constraint(equalToConstant: statisticView.frame.height/2 - 4),
            
            follovingBlogTitle.topAnchor.constraint(equalTo: statisticView.topAnchor),
            follovingBlogTitle.trailingAnchor.constraint(equalTo: statisticView.trailingAnchor),
            follovingBlogTitle.widthAnchor.constraint(equalToConstant: statisticView.frame.width/3 - 6),
            follovingBlogTitle.heightAnchor.constraint(equalToConstant: statisticView.frame.height/2 - 4),
            
            follovingBlogNameTitle.topAnchor.constraint(equalTo: follovingBlogTitle.bottomAnchor, constant: 8),
            follovingBlogNameTitle.centerXAnchor.constraint(equalTo: follovingBlogTitle.centerXAnchor),
            follovingBlogNameTitle.widthAnchor.constraint(equalToConstant: statisticView.frame.width/3 - 6),
            follovingBlogNameTitle.heightAnchor.constraint(equalToConstant: statisticView.frame.height/2 - 4),
            
            aboutAnotherSubTitle.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 24),
            aboutAnotherSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            aboutAnotherSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            aboutAnotherSubTitle.heightAnchor.constraint(equalToConstant: 28),

            aboutAnotherText.topAnchor.constraint(equalTo: aboutAnotherSubTitle.bottomAnchor, constant: 16),
            aboutAnotherText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            aboutAnotherText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            anotherBlogsSubTitle.topAnchor.constraint(equalTo: aboutAnotherText.bottomAnchor, constant: 30),
            anotherBlogsSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            anotherBlogsSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            anotherBlogsSubTitle.heightAnchor.constraint(equalToConstant: 28),
        ])
        
        if arrayBlogs.isEmpty {
            NSLayoutConstraint.activate([
                emptyTitle.topAnchor.constraint(equalTo: anotherBlogsSubTitle.bottomAnchor, constant: 24),
                emptyTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                emptyTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                emptyTitle.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24),
            ])
        } else if arrayBlogs.count <= 5 {
            NSLayoutConstraint.activate([
                blogTableView.topAnchor.constraint(equalTo: anotherBlogsSubTitle.bottomAnchor, constant: 12),
                blogTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                blogTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                blogTableView.heightAnchor.constraint(equalToConstant: heightBlogTableView),
                blogTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -12)
            ])
        } else {
            NSLayoutConstraint.activate([
                blogTableView.topAnchor.constraint(equalTo: anotherBlogsSubTitle.bottomAnchor, constant: 12),
                blogTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                blogTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                blogTableView.heightAnchor.constraint(equalToConstant: heightBlogTableView),
                
                moreBlogButton.topAnchor.constraint(equalTo: blogTableView.bottomAnchor, constant: 12),
                moreBlogButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                moreBlogButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                moreBlogButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24)
            ])
        }
        
       // setupCustom()
    }
    
    //MARK: Кастомные настройки, так как до viewDidLayoutSubviews они не работают
    private func setupCustom() {
        profileView.layer.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 32)
    }
    
    //MARK: Отключаем горизонтальную прокрутку
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
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
    private func tapBlogTableViewCell() {
        output.didTapBlogTableViewCell()
    }
    
    @objc
    private func tapMoreBlogButton() {
        output.didTapMoreBlogButton()
    }
    
}

extension AnotherProfileViewController: AnotherProfileViewInput {
}

extension AnotherProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBlogs.count > 5 ? 5 : arrayBlogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: SavedTableViewCell.identifier,
                for: indexPath) as? SavedTableViewCell else { return .init() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 168
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        tapBlogTableViewCell()
    }
}
