//
//  AdditionBlogViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class AdditionBlogViewController: UIViewController {
	private let output: AdditionBlogViewOutput

    //MARK: Объявление переменных
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleAdditionBlogScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let nextButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: StandartLanguage.nextButtonAdditionBlogScreen)
        button.addTarget(self, action: #selector(tapNextButton))
        return button
    }()
    
    private let blogTitleSubTitle : SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.blogTitleSubTitleAdditionBlogScreen,
                                size: .meb24)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let blogTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = StandartColors.enteredTextColor
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = StandartColors.titleColor.cgColor
        view.backgroundColor = StandartColors.standartBackgroundColor
        return view
    }()
    
    private let blogTitleText: Text = {
        let text = Text(text: StandartLanguage.blogTitleTextAdditionBlogScreen,
                        size: .mm17)
        text.editScrollEnabled(edit: true)
        text.editAligent(aligent: .natural)
        text.editWorkInText(edit: true)
        text.editColor(color: StandartColors.enteredTextColor)
        return text
    }()
    
    private let blogTitleErrorSubTitle: SubTitle = {
        let text = SubTitle(text: StandartLanguage.blogTitleErrorSubTitleAdditionBlogScreen,
                            size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.textErrorColor)
        return text
    }()
    
    private let tagSubTitle : SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.tagSubTitleAdditionBlogScreen,
                                size: .meb24)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let tagView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = StandartColors.enteredTextColor
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = StandartColors.titleColor.cgColor
        view.backgroundColor = StandartColors.standartBackgroundColor
        return view
    }()
    
    private let tagText: Text = {
        let text = Text(text: StandartLanguage.tagTextAdditionBlogScreen,
                        size: .mm17)
        text.editScrollEnabled(edit: true)
        text.editAligent(aligent: .natural)
        text.editWorkInText(edit: true)
        text.editColor(color: StandartColors.enteredTextColor)
        return text
    }()
    
    private let tagErrorSubTitle: SubTitle = {
        let text = SubTitle(text: StandartLanguage.tagErrorSubTitleAdditionBlogScreen,
                            size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.textErrorColor)
        return text
    }()
    
    init(output: AdditionBlogViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, nextButton, blogTitleSubTitle, tagSubTitle, blogTitleView,
         blogTitleErrorSubTitle, tagView, tagErrorSubTitle, blogTitleText, tagText].forEach { view.addSubview($0)}
        
        self.view.backgroundColor = StandartColors.createBlogBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            nextButton.centerYAnchor.constraint(equalTo: header.leftIcon.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            blogTitleSubTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            blogTitleSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            blogTitleSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            blogTitleSubTitle.heightAnchor.constraint(equalToConstant: 28),
            
            blogTitleView.topAnchor.constraint(equalTo: blogTitleSubTitle.bottomAnchor, constant: 5),
            blogTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            blogTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            blogTitleView.heightAnchor.constraint(equalToConstant: 168),
            
            blogTitleText.topAnchor.constraint(equalTo: blogTitleView.topAnchor, constant: 14),
            blogTitleText.bottomAnchor.constraint(equalTo: blogTitleView.bottomAnchor, constant: -14),
            blogTitleText.leadingAnchor.constraint(equalTo: blogTitleView.leadingAnchor, constant: 16),
            blogTitleText.trailingAnchor.constraint(equalTo: blogTitleView.trailingAnchor, constant: -16),
            
            blogTitleErrorSubTitle.topAnchor.constraint(equalTo: blogTitleView.bottomAnchor, constant: 5),
            blogTitleErrorSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            blogTitleErrorSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            blogTitleErrorSubTitle.heightAnchor.constraint(equalToConstant: 20),
            
            tagSubTitle.topAnchor.constraint(equalTo: blogTitleErrorSubTitle.bottomAnchor, constant: 5),
            tagSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            tagSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tagSubTitle.heightAnchor.constraint(equalToConstant: 28),
            
            tagView.topAnchor.constraint(equalTo: tagSubTitle.bottomAnchor, constant: 5),
            tagView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tagView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tagView.heightAnchor.constraint(equalToConstant: 168),
            
            tagText.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 14),
            tagText.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -14),
            tagText.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 16),
            tagText.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -16),
            
            tagErrorSubTitle.topAnchor.constraint(equalTo: tagView.bottomAnchor, constant: 5),
            tagErrorSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            tagErrorSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tagErrorSubTitle.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapNextButton() {
        output.didTapNextButton()
    }
}

extension AdditionBlogViewController: AdditionBlogViewInput {
}
