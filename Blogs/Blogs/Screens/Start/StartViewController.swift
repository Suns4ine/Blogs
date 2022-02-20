//
//  StartViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import UIKit

final class StartViewController: UIViewController {
	private let output: StartViewOutput
    
    //MARK: Create Variable
    private let leftMan: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "peep-standing-1")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 1
        return image
    }()
    
    private let rightMan: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "svg-editor-image")
        image.transform = CGAffineTransform(scaleX: -1, y: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 1
        return image
    }()
    
    private let titleLogin: Title = {
        let title = Title(text:  StandartLanguage.titleStartScreen, size: .meb36)
        return title
    }()
    
    private let textLogin: Text = {
        let text = Text(text: StandartLanguage.textStartScreen, size: .mm17)
        return text
    }()
    
    private let loginView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.firstLoginBackgroundColor
        view.layer.cornerRadius = CGFloat.standartCornerRadiusConstant
        view.layer.borderColor = StandartColors.borderColor.cgColor
        view.layer.borderWidth = CGFloat.borderConstant
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        return view
    }()
    
    private let emailButton: SecondBigButton = {
        let button = SecondBigButton(text: StandartLanguage.mailButtonStartScreen, icon: .mail)
        button.addTarget(self, action: #selector(tapEmailButton))
        return button
    }()
    
    private let facebookButton: SecondBigButton = {
        let button = SecondBigButton(text: StandartLanguage.facebookButtonStartScreen, icon: .facebook)
        button.addTarget(self, action: #selector(tapFacebookButton))
        button.editColor(color: StandartColors.facebookColor)
        return button
    }()
    
    private let twitterButton: SecondBigButton = {
        let button = SecondBigButton(text: StandartLanguage.twitterButtonStartScreen, icon: .twitter)
        button.addTarget(self, action: #selector(tapTwitterButton))
        button.editColor(color: StandartColors.twitterColor)
        return button
    }()
    
    //MARK: System override Functions
    init(output: StartViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        addSubViewInView()
        addLayoutSubviews()
        
        view.backgroundColor = StandartColors.startBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    //MARK: Personal Functions
    private func addLayoutSubviews() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat.loginViewIdentConstant),

            titleLogin.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            titleLogin.topAnchor.constraint(equalTo: loginView.topAnchor, constant: CGFloat.standartIdentConstant),
            titleLogin.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            titleLogin.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -CGFloat.standartIdentConstant),

            textLogin.topAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant: CGFloat.standartIdentConstant - 8),
            textLogin.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            textLogin.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -CGFloat.standartIdentConstant),

            emailButton.topAnchor.constraint(equalTo: textLogin.bottomAnchor, constant: CGFloat.standartIdentConstant - 8),
            emailButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            emailButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -CGFloat.standartIdentConstant),

            facebookButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: CGFloat.standartIdentConstant - 8),
            facebookButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            facebookButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -CGFloat.standartIdentConstant),

            twitterButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: CGFloat.standartIdentConstant - 8),
            twitterButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: CGFloat.standartIdentConstant),
            twitterButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            twitterButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: -(CGFloat.standartIdentConstant - 2)),
            
            leftMan.heightAnchor.constraint(equalToConstant: 462),
            leftMan.widthAnchor.constraint(equalToConstant: 174),
            leftMan.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            leftMan.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            
            rightMan.heightAnchor.constraint(equalToConstant: 503),
            rightMan.widthAnchor.constraint(equalToConstant: 222),
            rightMan.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            rightMan.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
        ])
    }
    
    private func addSubViewInView() {
        [loginView, leftMan, rightMan].forEach{ view.addSubview($0)}
        [titleLogin, textLogin, emailButton,
         facebookButton, twitterButton].forEach{ loginView.addSubview($0)}
    }
    
    @objc
    private func tapEmailButton() {
        output.didTapEmailButton()
    }
    
    @objc
    private func tapFacebookButton() {
        output.didTapFacebookButton()
    }
    
    @objc
    private func tapTwitterButton() {
        output.didTapTwitterButton()
    }
}

extension StartViewController: StartViewInput {
}
