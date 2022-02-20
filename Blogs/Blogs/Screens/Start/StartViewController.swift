//
//  StartViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import UIKit

final class StartViewController: UIViewController {
    
    //MARK: Private Property
    
    private let output: StartViewOutput
    
    private let leftMan: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageAssets.peepStanding1.rawValue)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 1
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let rightMan: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageAssets.peepStanding32.rawValue)
        image.transform = CGAffineTransform(scaleX: -1, y: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.zPosition = 1
        image.contentMode = .scaleAspectFit
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
    
    private let loginStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 2
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = CGFloat.standartIdentConstant - 8
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
    
    //MARK: Inits
    
    init(output: StartViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
        addSubViewInView()
        addLayoutSubviews()
        
        view.backgroundColor = StandartColors.startBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    //MARK: Private Methods
    
    private func addLayoutSubviews() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: CGFloat.standartIdentConstant),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -CGFloat.standartIdentConstant),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                               constant: CGFloat.loginViewIdentConstant),

            loginStackView.topAnchor.constraint(equalTo: loginView.topAnchor,
                                                constant: CGFloat.standartIdentConstant),
            loginStackView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor,
                                                    constant: CGFloat.standartIdentConstant),
            loginStackView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor,
                                                    constant: -CGFloat.standartIdentConstant),
            loginStackView.bottomAnchor.constraint(equalTo: loginView.bottomAnchor,
                                              constant: -(CGFloat.standartIdentConstant - 2)),
            
            leftMan.heightAnchor.constraint(equalToConstant: view.bounds.height/1.6),
            leftMan.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            leftMan.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            
            rightMan.heightAnchor.constraint(equalToConstant: view.bounds.height/1.6),
            rightMan.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25),
            rightMan.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
        ])
    }
    
    private func addSubViewInView() {
        [ loginView, leftMan, rightMan].forEach{ view.addSubview($0)}
        loginView.addSubview(loginStackView)
        [titleLogin, textLogin, emailButton,
         facebookButton, twitterButton].forEach{ loginStackView.addArrangedSubview($0)}
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
