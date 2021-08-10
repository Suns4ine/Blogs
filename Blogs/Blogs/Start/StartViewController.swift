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
    
    private let leftMan: UIImageView = {
        let image = UIImageView()
        image.image = image.randomStandingPeople()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 1
        return image
    }()
    
    private let righttMan: UIImageView = {
        let image = UIImageView()
        image.image = image.randomStandingPeople()
        image.transform = CGAffineTransform(scaleX: -1, y: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 1
        return image
    }()
    

    private let titleLogin: Title = {
        let title = Title(text: "Логин", size: .big)
        return title
    }()
    
    private let textLogin: Text = {
        let text = Text(text: "You don’t think you should login first and behave like human not robot.", size: .standart)
        text.sizeToFit()
        return text
    }()
    
    private let loginView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.firstLoginBackgroundColor
        view.layer.cornerRadius = 16
        view.layer.borderColor = StandartColors.TitleColor.cgColor
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
    
    private let arrayButton: [String] = ["Email", "Facebook", "Twitter"]
    
    init(output: StartViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }
    
//    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [loginView, leftMan, righttMan].forEach{ view.addSubview($0)}
        [titleLogin, textLogin, emailButton, facebookButton, twitterButton].forEach{ loginView.addSubview($0)}
        
        view.backgroundColor = StandartColors.startBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
//    private func returnButtons(array: [String]) -> [SecondBigButton] {
//        let arrayButton: [SecondBigButton] = []
//        var tag = 1
//
//        for value in array {
//            let button = SecondBigButton(text: value, icon: .none)
//            button.tag = tag
//            tag += 1
//        }
//
//        return arrayButton
//    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginView.heightAnchor.constraint(equalToConstant: 404),
            
            titleLogin.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            titleLogin.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 24),
            
            textLogin.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            textLogin.topAnchor.constraint(equalTo: titleLogin.bottomAnchor, constant: 16),
            textLogin.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 24),
            textLogin.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -24),
            textLogin.heightAnchor.constraint(equalToConstant: 72),
            
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
            
            righttMan.heightAnchor.constraint(equalToConstant: 462),
            righttMan.widthAnchor.constraint(equalToConstant: 204),
            righttMan.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            righttMan.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
        ])
    }
}

extension StartViewController: StartViewInput {
}