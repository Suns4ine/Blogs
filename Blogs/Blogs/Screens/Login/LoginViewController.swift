//
//  LoginViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import UIKit

final class LoginViewController: UIViewController {
    
	private let output: LoginViewOutput
    
    //MARK: Объявление переменных
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleLoginScreen,
                            leftIcon: .init(icon: .outline3, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let logo: IconImage = {
        let icon = IconImage(icon: .logo, size: .size120)
        return icon
    }()
    
    private let LoginTitle: Title = {
        let title = Title(text: StandartLanguage.titleLoginScreen, size: .meb36)
        return title
    }()
    
    private let loginTextField: TextField = {
        let textfiled = TextField(name: StandartLanguage.loginTextFieldNameLoginScreen,
                                  shadowText: StandartLanguage.loginTextFieldShadowTextLoginScreen,
                                  error: StandartLanguage.loginTextFieldErrorLoginScreen)
        return textfiled
    }()
    
    private let passwordTextField: TextField = {
        let textfiled = TextField(name: StandartLanguage.passwordTextFieldNameLoginScreen,
                                  shadowText: StandartLanguage.passwordTextFieldShadowTextLoginScreen,
                                  error: StandartLanguage.passwordTextFieldErrorLoginScreen)
        textfiled.editSecureTextEntry(entry: true)
        return textfiled
    }()
    
    private let signInButton: FirstBigButton = {
        let button = FirstBigButton(text: StandartLanguage.signInButtonLoginScreen)
        button.addTarget(self, action: #selector(tapSignInButton))
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.sizeToFit()
        button.setTitle(StandartLanguage.signUpButtonLoginScreen, for: .normal)
        button.titleLabel?.font = .fourthTextFont
        button.setTitleColor(StandartColors.textErrorColor, for: .normal)
        button.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    init(output: LoginViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loginTextField.clearText()
        passwordTextField.clearText()
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        [header, logo, LoginTitle, loginTextField,
         passwordTextField, signInButton, signUpButton].forEach{ view.addSubview($0)}
        
        self.view.backgroundColor = StandartColors.firstLoginBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 18),
            
            LoginTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LoginTitle.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 32),
            
            loginTextField.topAnchor.constraint(equalTo: LoginTitle.bottomAnchor, constant: 5),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 7),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 15)
        ])
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapSignInButton() {
        output.didFinishLoginText(text: loginTextField.textField.text ?? "")
        output.didFinishPasswordText(text: passwordTextField.password)
        output.didTapSignInButton()
    }
    
    @objc
    private func tapSignUpButton() {
        output.didTapSignUpButton()
    }
}

extension LoginViewController: LoginViewInput {
    func showErrorLogin(text: String) {
        loginTextField.editErrorText(text: text)
    }
    
    func showErrorPassword(text: String) {
        passwordTextField.editErrorText(text: text)
    }
    
}
