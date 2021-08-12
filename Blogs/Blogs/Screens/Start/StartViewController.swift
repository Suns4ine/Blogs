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
    
    //MARK: Объявление перменных
    private let leftMan: UIImageView = {
        let image = UIImageView()
        image.image = image.randomStandingPeople()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 1
        return image
    }()
    
    private let rightMan: UIImageView = {
        let image = UIImageView()
        image.image = image.randomStandingPeople()
        image.transform = CGAffineTransform(scaleX: -1, y: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 1
        return image
    }()
    

    private let titleLogin: Title = {
        let title = Title(text: "Логин", size: .meb36)
        return title
    }()
    
    private let textLogin: Text = {
        let text = Text(text: "You don’t think you should login first and behave like human not robot.", size: .mm17)
        text.sizeToFit()
        return text
    }()
    
    private let loginView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.firstLoginBackgroundColor
        view.layer.cornerRadius = 16
        view.layer.borderColor = StandartColors.titleColor.cgColor
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        return view
    }()
    
    private let emailButton: SecondBigButton = {
        let button = SecondBigButton(text: "Email", icon: .mail)
        return button
    }()
    
    private let facebookButton: SecondBigButton = {
        let button = SecondBigButton(text: "Facebook", icon: .facebook)
        button.editColor(color: StandartColors.facebookColor)
        return button
    }()
    
    private let twitterButton: SecondBigButton = {
        let button = SecondBigButton(text: "twitter", icon: .twitter)
        button.editColor(color: StandartColors.twitterColor)
        return button
    }()
    
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
        [loginView, leftMan, rightMan].forEach{ view.addSubview($0)}
        [titleLogin, textLogin, emailButton, facebookButton, twitterButton].forEach{ loginView.addSubview($0)}
        
        view.backgroundColor = StandartColors.startBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginView.heightAnchor.constraint(equalToConstant: 414),
            
            titleLogin.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            titleLogin.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 24),
            
            textLogin.topAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant: 16),
            textLogin.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 24),
            textLogin.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -24),
            
            emailButton.topAnchor.constraint(equalTo: textLogin.bottomAnchor, constant: 16),
            emailButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 24),
            emailButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -24),
            
            facebookButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 16),
            facebookButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 24),
            facebookButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -24),
            
            twitterButton.topAnchor.constraint(equalTo: facebookButton.bottomAnchor, constant: 16),
            twitterButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 24),
            twitterButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -24),
            
            leftMan.heightAnchor.constraint(equalToConstant: 462),
            leftMan.widthAnchor.constraint(equalToConstant: 204),
            leftMan.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            leftMan.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11),
            
            rightMan.heightAnchor.constraint(equalToConstant: 462),
            rightMan.widthAnchor.constraint(equalToConstant: 204),
            rightMan.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            rightMan.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
        ])
    }
}

extension StartViewController: StartViewInput {
}
