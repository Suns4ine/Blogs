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
        let header = Header(title: StandartLanguage.headerTitleSignUpScreen,
                            leftIcon: .init(icon: .outline1, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let signUpTitle: Title = {
        let title = Title(text: StandartLanguage.titleSignUpScreen, size: .meb36)
        return title
    }()
    
    private let text: Text = {
        let text = Text(text: StandartLanguage.textSignUpScreen, size: .mm17)
        text.editAligent(aligent: .left)
        text.sizeToFit()
        return text
    }()
    
    private let nameTextField: TextField = {
        let textfiled = TextField(name: StandartLanguage.nameTextFieldNameSignUpScreen,
                                  shadowText: StandartLanguage.nameTextFieldShadowTextSignUpScreen,
                                  error: StandartLanguage.nameTextFieldErrorSignUpScreen)
        textfiled.editAutocapitalizationType(type: .sentences)
        return textfiled
    }()
    
    private let mailTextField: TextField = {
        let textfiled = TextField(name: StandartLanguage.mailTextFieldNameSignUpScreen,
                                  shadowText: StandartLanguage.mailTextFieldShadowTextSignUpScreen,
                                  error: StandartLanguage.mailTextFieldErrorSignUpScreen)
        return textfiled
    }()
    
    private let passwordTextField: TextField = {
        let textfiled = TextField(name: StandartLanguage.passwordTextFieldNameSignUpScreen,
                                  shadowText: StandartLanguage.passwordTextFieldShadowTextSignUpScreen,
                                  error: StandartLanguage.passwordTextFieldErrorSignUpScreen)
        textfiled.editSecureTextEntry(entry: true)
        return textfiled
    }()
    
    private let registerButton: FirstBigButton = {
        let button = FirstBigButton(text: StandartLanguage.registerButtonSignUpScreen)
        button.addTarget(self, action: #selector(tapRegisterButton))
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nameTextField.clearText()
        mailTextField.clearText()
        passwordTextField.clearText()
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
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapRegisterButton() {
        output.didFinishNameText(text: nameTextField.textField.text ?? "")
        output.didFinishMailText(text: mailTextField.textField.text ?? "")
        output.didFinishPasswordText(text: passwordTextField.password)
        output.didTapRegisterButton()
    }
}

extension SignUpViewController: SignUpViewInput {
    func showErrorName(text: String) {
        nameTextField.editErrorText(text: text)
    }
    
    func showErrorMail(text: String) {
        mailTextField.editErrorText(text: text)
    }
    
    func showErrorPassword(text: String) {
        passwordTextField.editErrorText(text: text)
    }
    
}
