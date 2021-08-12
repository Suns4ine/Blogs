//
//  SignUpViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import UIKit

final class SignUpViewController: UIViewController {
	private let output: SignUpViewOutput

    //MARK: Объявление переменных
    private let header: Header = {
        let header = Header(title: "", leftIcon: .init(icon: .outline1, size: .standart), rightIcon: .init(icon: .none, size: .small))
        return header
    }()
    
    private let signUpTitle: Title = {
        let title = Title(text: "Регистрация", size: .meb36)
        return title
    }()
    
    private let text: Text = {
        let text = Text(text: "You have chance to create new account if you really want to.", size: .mm17)
        text.editAligent(aligent: .left)
        text.sizeToFit()
        return text
    }()
    
    private let nameTextField: TextField = {
        let textfiled = TextField(name: "Имя", shadowText: "", error: "Имя")
        return textfiled
    }()
    
    private let mailTextField: TextField = {
        let textfiled = TextField(name: "Почта", shadowText: "", error: "Почта")
        return textfiled
    }()
    
    private let passwordTextField: TextField = {
        let textfiled = TextField(name: "Пароль", shadowText: "", error: "Пароль")
        return textfiled
    }()
    
    private let registerButton: FirstBigButton = {
        let button = FirstBigButton(text: "Зарегистрироваться")
        return button
    }()
    
    init(output: SignUpViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, signUpTitle, text, nameTextField, mailTextField, passwordTextField, registerButton].forEach{ view.addSubview($0)}
        
        view.backgroundColor = StandartColors.firstLoginBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            signUpTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 12),
            signUpTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            text.topAnchor.constraint(equalTo: signUpTitle.bottomAnchor, constant: 12),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            nameTextField.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            mailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 5),
            mailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            passwordTextField.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 7),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}

extension SignUpViewController: SignUpViewInput {
}
