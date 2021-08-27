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
        let header = Header(title: StandartLanguage.headerTitleEditProfileScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: nil, size: .size100)
        return avatar
    }()
    
    private let editAvatarButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: StandartLanguage.editAvatarButtonEditProfileScreen)
        button.addTarget(self, action: #selector(tapEditAvatarButton))
        return button
    }()
    
    private let nameTextfield: TextField = {
        let textfield = TextField(name: StandartLanguage.nameTextfieldNameEditProfileScreen,
                                  shadowText: StandartLanguage.nameTextfieldShadowTextEditProfileScreen,
                                  error: StandartLanguage.nameTextfieldErrorEditProfileScreen)
        textfield.editNameColor(color: StandartColors.anotherSubTitleColor)
        return textfield
    }()
    
    private let surnameTextfield: TextField = {
        let textfield = TextField(name: StandartLanguage.surnameTextfieldNameEditProfileScreen,
                                  shadowText: StandartLanguage.surnameTextfieldShadowTextEditProfileScreen,
                                  error: StandartLanguage.surnameTextfieldErrorEditProfileScreen)
        textfield.editNameColor(color: StandartColors.anotherSubTitleColor)
        return textfield
    }()
    
    private let tagNameTextfield: TextField = {
        let textfield = TextField(name: StandartLanguage.tagNameTextfieldNameEditProfileScreen,
                                  shadowText: StandartLanguage.tagNameTextfieldShadowTextEditProfileScreen,
                                  error: StandartLanguage.tagNameTextfieldErrorEditProfileScreen)
        textfield.editNameColor(color: StandartColors.anotherSubTitleColor)
        return textfield
    }()
    
    private let aboutMeSubTitle: SubTitle = {
        let text = SubTitle(text: StandartLanguage.aboutMeSubTitleEditProfileScreen,
                            size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.anotherSubTitleColor)
        return text
    }()
    
    private let aboutMeErrorSubTitle: SubTitle = {
        let text = SubTitle(text: StandartLanguage.aboutMeErrorSubTitleEditProfileScreen,
                            size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.textErrorColor)
        return text
    }()
    
    
    private let aboutMeText: Text = {
        let text = Text(text: StandartLanguage.aboutMeTextEditProfileScreen,
                        size: .mm17)
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
        let button = SecondBigButton(text: StandartLanguage.saveButtonEditProfileScreen,
                                     icon: .none)
        button.addTarget(self, action: #selector(tapSaveButton))
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
    
    private func addSubViewInScrollView() {
        let array = [header, avatar, editAvatarButton, nameTextfield,
                    surnameTextfield, tagNameTextfield, aboutMeView,
                    aboutMeText, aboutMeSubTitle, aboutMeErrorSubTitle,
                    saveButton]
        
        array.forEach{ scrollView.addSubview($0) }
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [scrollView].forEach{ view.addSubview($0)}
        addSubViewInScrollView()
        
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
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapEditAvatarButton() {
        output.didTapEditAvatarButton()
    }
    
    @objc
    private func tapSaveButton() {
        output.didTapSaveButton()
    }
    
    //MARK: Отключаем горизонтальную прокрутку
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0.0
    }
}

extension EditProfileViewController: EditProfileViewInput {
}
