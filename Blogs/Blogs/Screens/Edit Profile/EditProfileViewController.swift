//
//  EditProfileViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class EditProfileViewController: UIViewController {
	private let output: EditProfileViewOutput

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
        let header = Header(title: "Редактирование",
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        return header
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: nil, size: .size100)
        return avatar
    }()
    
    private let editAvatarButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: "editAvatarButton")
        return button
    }()
    
    private let nameTextfield: TextField = {
        let textfield = TextField(name: "nameTextfield", shadowText: "", error: "nameTextfield")
        textfield.editNameColor(color: StandartColors.anotherSubTitleColor)
        return textfield
    }()
    
    private let surnameTextfield: TextField = {
        let textfield = TextField(name: "surnameTextfield", shadowText: "", error: "surnameTextfield")
        textfield.editNameColor(color: StandartColors.anotherSubTitleColor)
        return textfield
    }()
    
    private let tagNameTextfield: TextField = {
        let textfield = TextField(name: "tagNameTextfield", shadowText: "", error: "tagNameTextfield")
        textfield.editNameColor(color: StandartColors.anotherSubTitleColor)
        return textfield
    }()
    
    private let aboutMeSubTitle: SubTitle = {
        let text = SubTitle(text: "aboutMeSubTitle", size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.anotherSubTitleColor)
        return text
    }()
    
    private let aboutMeErrorSubTitle: SubTitle = {
        let text = SubTitle(text: "aboutMeErrorSubTitle", size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.textErrorColor)
        return text
    }()
    
    
    private let aboutMeText: Text = {
        let text = Text(text: "Hacker Cup is Facebook's annual open programming competition. Open to participants around the world, we invite you to apply problem-solving and algorithmic coding skills to advance through each year’s online rounds, win prizes, and have a chance to make it to the global finals and win the grand prize. Hacker Cup is Facebook's annual open programming competition. Open to participants around the world, we invite you to apply problem-solving and algorithmic coding skills to advance through each year’s online rounds, win prizes, and have a chance to make it to the global finals and win the grand prize.", size: .mm17)
        text.editScrollEnabled(edit: true)
        text.editAligent(aligent: .natural)
        text.editWorkInText(edit: true)
        text.editColor(color: StandartColors.enteredTextColor)
        return text
    }()
    
    private let aboutMeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = StandartColors.enteredTextColor
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = StandartColors.titleColor.cgColor
        view.backgroundColor = StandartColors.standartBackgroundColor
        return view
    }()
    
    private let saveButton: SecondBigButton = {
        let button = SecondBigButton(text: "saveButton", icon: .none)
        return button
    }()
    
    init(output: EditProfileViewOutput) {
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
        [header, avatar, editAvatarButton, nameTextfield,
         surnameTextfield, tagNameTextfield, aboutMeView,
         aboutMeText, aboutMeSubTitle, aboutMeErrorSubTitle,
         saveButton].forEach{ scrollView.addSubview($0)}
        
        self.view.backgroundColor = StandartColors.myProfileColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
            
            avatar.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 14),
            avatar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            editAvatarButton.centerYAnchor.constraint(equalTo: avatar.centerYAnchor),
            editAvatarButton.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 34),
            editAvatarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            nameTextfield.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 5),
            nameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            surnameTextfield.topAnchor.constraint(equalTo: nameTextfield.bottomAnchor, constant: 5),
            surnameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            surnameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            tagNameTextfield.topAnchor.constraint(equalTo: surnameTextfield.bottomAnchor, constant: 5),
            tagNameTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tagNameTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            aboutMeSubTitle.topAnchor.constraint(equalTo: tagNameTextfield.bottomAnchor, constant: 5),
            aboutMeSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            aboutMeSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            aboutMeSubTitle.heightAnchor.constraint(equalToConstant: 20),
            
            aboutMeView.topAnchor.constraint(equalTo: aboutMeSubTitle.bottomAnchor, constant: 5),
            aboutMeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            aboutMeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            aboutMeView.heightAnchor.constraint(equalToConstant: 168),
            
            aboutMeText.topAnchor.constraint(equalTo: aboutMeView.topAnchor, constant: 14),
            aboutMeText.bottomAnchor.constraint(equalTo: aboutMeView.bottomAnchor, constant: -14),
            aboutMeText.leadingAnchor.constraint(equalTo: aboutMeView.leadingAnchor, constant: 16),
            aboutMeText.trailingAnchor.constraint(equalTo: aboutMeView.trailingAnchor, constant: -16),
            
            aboutMeErrorSubTitle.topAnchor.constraint(equalTo: aboutMeView.bottomAnchor, constant: 5),
            aboutMeErrorSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            aboutMeErrorSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            aboutMeErrorSubTitle.heightAnchor.constraint(equalToConstant: 20),
            
            saveButton.topAnchor.constraint(equalTo: aboutMeErrorSubTitle.bottomAnchor, constant: 24),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            saveButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24)
            
        ])
    }
    
    //MARK: Отключаем горизонтальную прокрутку
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
    }
}

extension EditProfileViewController: EditProfileViewInput {
}
