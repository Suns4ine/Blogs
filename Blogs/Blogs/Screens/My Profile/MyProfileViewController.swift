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

    //MARK: Create Variable
    private var section: StandartBlogSectionRowPresentable = StandartBlogSectionViewModel() {
        didSet {
            moreBlogButton.isHidden = section.rows.count > 3 ? false : true
            heightBlogTableView = CGFloat(output.giveTableHeight())
        }
    }
    
    private lazy var heightBlogTableView: CGFloat = CGFloat(output.giveTableHeight())
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private let refreshControl: RefreshControl = {
        let refresh = RefreshControl()
        refresh.addTarget(self, action: #selector(refreshControlUpDate), for: .valueChanged)
        return refresh
    }()
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleMyProfileScreen,
                            leftIcon: .init(icon: .alignJustify, size: .size24),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapSettingButton))
        return header
    }()
    
    private let profileView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 32
        view.backgroundColor = StandartColors.myProfileColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: nil, size: .size170)
        return avatar
    }()
    
    private let nameTitle: Title = {
        let title = Title(text: StandartLanguage.nameTitleMyProfileScreen,
                          size: .meb36)
        title.editColor(color: StandartColors.anotherTitleColor)
        return title
    }()
    
    private let nameTagSubtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.nameTagSubtitleMyProfileScreen,
                                size: .mm15)
        subtitle.editColor(color: StandartColors.anotherSubTitleColor)
        return subtitle
    }()
    
    private let editButton: ThirdBigButton = {
        let button = ThirdBigButton(text: StandartLanguage.editButtonMyProfileScreen)
        button.addTarget(self, action: #selector(tapEditButton))
        return button
    }()
    
    private let statisticView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let aboutMeSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.aboutMeSubTitleMyProfileScreen,
                                size: .mb21)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()

    private let aboutMeText: Text = {
        let text = Text(text: StandartLanguage.aboutMeTextMyProfileScreen,
                        size: .mm15)
        text.editAligent(aligent: .natural)
        return text
    }()
    
    private let myBlogsSubTitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.myBlogsSubTitleMyProfileScreen,
                                size: .mb21)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let createBlogButton: FirstBigButton = {
        let button = FirstBigButton(text: StandartLanguage.createBlogButtonMyProfileScreen)
        button.addTarget(self, action: #selector(tapCreateBlogButton))
        return button
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
        let button = SecondBigButton(text: StandartLanguage.moreBlogButtonMyProfileScreen,
                                     icon: .none)
        button.addTarget(self, action: #selector(tapMoreBlogButton))
        return button
    }()
    
    private let extraProfileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = StandartColors.myProfileColor
        return view
    }()
    
    private let numberBlogTitle: SubTitle = {
        let title = SubTitle(text: StandartLanguage.numberBlogTitleMyProfileScreen,
                             size: .meb24)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private let numberBlogNameTitle: SubTitle = {
        let title = SubTitle(text: StandartLanguage.numberBlogNameTitleMyProfileScreen,
                             size: .mm15)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private let followersBlogTitle: SubTitle = {
        let title = SubTitle(text: StandartLanguage.followersBlogTitleMyProfileScreen,
                             size: .meb24)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()

    private let followersBlogNameTitle: SubTitle = {
        let title = SubTitle(text: StandartLanguage.followersBlogNameTitleMyProfileScreen,
                             size: .mm15)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private let follovingBlogTitle: SubTitle = {
        let title = SubTitle(text: StandartLanguage.follovingBlogTitleMyProfileScreen,
                             size: .meb24)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    private let follovingBlogNameTitle: SubTitle = {
        let title = SubTitle(text: StandartLanguage.follovingBlogNameTitleMyProfileScreen,
                             size: .mm15)
        title.editColor(color: StandartColors.anotherSubTitleColor)
        title.sizeToFit()
        return title
    }()
    
    //MARK: System override Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        output.fetchBlogsCell()
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        [extraProfileView, scrollView].forEach{ view.addSubview($0)}
        addSubViewInScrollView()
        
        output.setupTextInViews()
        moreBlogButton.isHidden = section.rows.count > 3 ? false : true
        scrollView.delegate =  self
        blogTableView.delegate = self
        blogTableView.dataSource = self
        blogTableView.register(StandartBlogTableViewCell.self,
                               forCellReuseIdentifier: StandartBlogTableViewCell.identifier)
        
        self.view.backgroundColor = StandartColors.standartBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    init(output: MyProfileViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Отключаем горизонтальную прокрутку
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
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
            nameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            nameTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            nameTitle.heightAnchor.constraint(lessThanOrEqualToConstant: 88),
            
            nameTagSubtitle.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 7),
            nameTagSubtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            nameTagSubtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            nameTagSubtitle.heightAnchor.constraint(equalToConstant: 24),
            
            editButton.topAnchor.constraint(equalTo: nameTagSubtitle.bottomAnchor, constant: 24),
            editButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            editButton.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 44),
            editButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -44),
            
            statisticView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 32),
            statisticView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            statisticView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            statisticView.heightAnchor.constraint(equalToConstant: 60),
            
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

            createBlogButton.topAnchor.constraint(equalTo: myBlogsSubTitle.bottomAnchor, constant: 24),
            createBlogButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            createBlogButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
        
        if section.rows.isEmpty {
            NSLayoutConstraint.activate([
                createBlogButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24)
            ])
        } else if section.rows.count <= 3 {
            NSLayoutConstraint.activate([
                blogTableView.topAnchor.constraint(equalTo: createBlogButton.bottomAnchor, constant: 12),
                blogTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                blogTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                blogTableView.heightAnchor.constraint(equalToConstant: heightBlogTableView),
                blogTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -12)
            ])
        } else {
            NSLayoutConstraint.activate([
                blogTableView.topAnchor.constraint(equalTo: createBlogButton.bottomAnchor, constant: 12),
                blogTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                blogTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                blogTableView.heightAnchor.constraint(equalToConstant: heightBlogTableView),
                
                moreBlogButton.topAnchor.constraint(equalTo: blogTableView.bottomAnchor, constant: 12),
                moreBlogButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                moreBlogButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                moreBlogButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24)
            ])
        }
        
        //Так как контент может не занять весь размер экрана, он ужимался и уползал вверх
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width,
                                        height: scrollView.contentSize.height > view.frame.size.height ?
                                        scrollView.contentSize.height :  view.frame.size.height + 1)
    }
    
    //MARK: Personal Functions
    private func addSubViewInScrollView() {
        let array = [ profileView, avatar, header, nameTitle, nameTagSubtitle,
                      editButton, statisticView, aboutMeSubTitle, aboutMeText,
                      myBlogsSubTitle, createBlogButton, blogTableView, moreBlogButton,
                      numberBlogTitle, followersBlogTitle, follovingBlogTitle, numberBlogNameTitle,
                      followersBlogNameTitle, follovingBlogNameTitle, refreshControl]
        
        array.forEach{ scrollView.addSubview($0)}
    }
    
    @objc
    private func refreshControlUpDate() {
        self.refreshControl.startAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.output.fetchBlogsCell()
            self.output.setupTextInViews()
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc
    private func tapSettingButton() {
        output.didTapSettingButton()
    }
    
    @objc
    private func tapEditButton() {
        output.didTapEditButton()
    }
    
    @objc
    private func tapCreateBlogButton() {
        output.didTapCreateBolgButton()
    }
    
    @objc
    private func tapMoreBlogButton() {
        output.didTapMoreBlogButton()
    }
}

extension MyProfileViewController: MyProfileViewInput, UIScrollViewDelegate {
    func clearTableCell(at indexPath: IndexPath) {
        section.rows.remove(at: indexPath.row)
        blogTableView.reloadData()
    }
    
    func updateViews(profile: User) {
        let path = getDocumentsDirectory().appendingPathComponent(profile.identifier)
        let image = UIImage(contentsOfFile: path.path) ?? .init()
        let aboutMe = profile.aboutMe.isEmpty ? "Здесь будет Ваше описание" : profile.aboutMe
        
        avatar.editImage(image: image)
        nameTitle.editText(text: profile.surname + " " + profile.name)
        nameTagSubtitle.editText(text: profile.tagname)
        aboutMeText.editText(text: aboutMe)
        numberBlogTitle.editText(text: String(profile.arrayBlogs.count))
        followersBlogTitle.editText(text: String(profile.arrayFollowers.count))
        follovingBlogTitle.editText(text: String(profile.arrayFolloving.count))
    }
    
    func reloadData(for section: StandartBlogSectionViewModel) {
        self.section = section
        blogTableView.reloadData()
    }
}

extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section.rows.count > 3 ? 3 : self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.cellIdentifier,
                for: indexPath) as? StandartBlogTableViewCell else { return .init() }
        cell.viewModel = viewModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(section.rows[indexPath.row].cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        output.didTapBlogTableViewCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive,
                                        title: StandartLanguage.deleteActionStandartBlogCell) { [weak self] (action, view, completionHandler) in
                                            self?.output.deleteTableViewCell(at: indexPath)
                                            completionHandler(true)
        }
        
        action.backgroundColor = StandartColors.deleteActionColor
        action.image = UIImage(named: "trash-2")
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
