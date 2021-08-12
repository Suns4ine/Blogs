//
//  MyProfileViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import UIKit

final class MyProfileViewController: UIViewController {
	private let output: MyProfileViewOutput

    //MARK: Объявление переменных
    private var arrayBlogs: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]
    private lazy var heightBlogTableView: CGFloat = CGFloat(arrayBlogs.count > 5 ? 5 * 168 : arrayBlogs.count * 168)
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .firstSunnyRed
        //scroll.layer.zPosition = -1
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private let header: Header = {
        let header = Header(title: "",
                            leftIcon: .init(icon: .alignJustify, size: .small),
                            rightIcon: .init(icon: .none, size: .small))
        header.layer.zPosition = 1
        return header
    }()
    
    private let profileView: UIView = {
        let view = UIView()
        view.layer.zPosition = 0
        view.backgroundColor = StandartColors.myProfileColor
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.layer.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 32)
        return view
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: nil, size: .big)
        return avatar
    }()
    
    private let nameTitle: Title = {
        let title = Title(text: "Name and Surname Title", size: .meb36)
        return title
    }()
    
    private let nameTagSubtitle: SubTitle = {
        let subtitle = SubTitle(text: "nameTagSubtitle", size: .mm15)
        return subtitle
    }()
    
    private let editButton: ThirdBigButton = {
       let button = ThirdBigButton(text: "editButton")
        return button
    }()
    
    private let statisticView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .firstYellow
        return view
    }()
    
    private let aboutMeSubTitle: SubTitle = {
        let subtitle = SubTitle(text: "aboutMeSubTitle", size: .mb21)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()

    private let aboutMeText: Text = {
        let text = Text(text: "aboutMeText Wireframe is still important for ideation. It will help you to quickly test idea.", size: .mm15)
        text.editAligent(aligent: .natural)
        return text
    }()
    
    private let myBlogsSubTitle: SubTitle = {
        let subtitle = SubTitle(text: "myBlogsSubTitle", size: .mb21)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let createBolgButton: FirstBigButton = {
        let button = FirstBigButton(text: "createBolgButton")
        return button
    }()
    
    private let blogTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.sizeToFit()
        return table
    }()
    
    private let moreBlogButton: SecondBigButton = {
        let button = SecondBigButton(text: "moreBlogButton", icon: .none)
        return button
    }()
    
    ///////////////////////////////////
    private let firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondPink
        return view
    }()
    
    private let secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondBlue
        return view
    }()
    private let thirdView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondBlack
        return view
    }()
    private let fourthView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondYellow
        return view
    }()
    
	override func viewDidLoad() {
		super.viewDidLoad()
        view.addSubview(scrollView)
        [ profileView, header, avatar, nameTitle, nameTagSubtitle,
          editButton, statisticView, aboutMeSubTitle, aboutMeText,
          myBlogsSubTitle, createBolgButton, blogTableView, moreBlogButton ].forEach{ scrollView.addSubview($0)}
        scrollView.delegate =  self
        
        [firstView, secondView, thirdView, fourthView].forEach{scrollView.addSubview($0)}//Elfkbnm

        blogTableView.delegate = self
        blogTableView.dataSource = self
        blogTableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
        
        self.view.backgroundColor = StandartColors.standartBackgroundColor
       // scrollView.contentSize.width = view.bounds.width
        scrollView.frame = view.frame
        //scrollView.contentSize.height = view.bounds.height * 6
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 6)
    }
    
    init(output: MyProfileViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
          //  scrollView.contentLayoutGuide.heightAnchor.constraint(equalToConstant:  view.bounds.height * 6),

            
            header.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            avatar.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            avatar.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25.5),

            nameTitle.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 21),
            nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            nameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            nameTitle.heightAnchor.constraint(lessThanOrEqualToConstant: 88),
            
            nameTagSubtitle.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 7),
            nameTagSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            nameTagSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            nameTagSubtitle.heightAnchor.constraint(equalToConstant: 24),
            
            editButton.topAnchor.constraint(equalTo: nameTagSubtitle.bottomAnchor, constant: 24),
            editButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            editButton.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 44),
            editButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -44),
            
            statisticView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 32),
            statisticView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            statisticView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            statisticView.heightAnchor.constraint(equalToConstant: 60),
            
            profileView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: statisticView.bottomAnchor, constant: 36),
            
            aboutMeSubTitle.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 24),
            aboutMeSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            aboutMeSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            aboutMeSubTitle.heightAnchor.constraint(equalToConstant: 28),

            aboutMeText.topAnchor.constraint(equalTo: aboutMeSubTitle.bottomAnchor, constant: 16),
            aboutMeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            aboutMeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            myBlogsSubTitle.topAnchor.constraint(equalTo: aboutMeText.bottomAnchor, constant: 30),
            myBlogsSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myBlogsSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            myBlogsSubTitle.heightAnchor.constraint(equalToConstant: 28),

            createBolgButton.topAnchor.constraint(equalTo: myBlogsSubTitle.bottomAnchor, constant: 24),
            createBolgButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            createBolgButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            blogTableView.topAnchor.constraint(equalTo: createBolgButton.bottomAnchor, constant: 24),
            blogTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blogTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blogTableView.heightAnchor.constraint(equalToConstant: heightBlogTableView),
            //blogTableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
           // blogTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
            moreBlogButton.topAnchor.constraint(equalTo: blogTableView.bottomAnchor, constant: 24),
            moreBlogButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            moreBlogButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            moreBlogButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24)

        ])
    }
    
    //MARK: Отключаем горизонтальную прокрутку
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
    }
}

extension MyProfileViewController: MyProfileViewInput, UIScrollViewDelegate {
}

extension CALayer {
  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let maskPath = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))

    let shape = CAShapeLayer()
    shape.path = maskPath.cgPath
    mask = shape
  }
}


extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
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
    
}
