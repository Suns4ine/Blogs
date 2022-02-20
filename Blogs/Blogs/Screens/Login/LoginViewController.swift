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
    
    //MARK: Create Variable
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleLoginScreen,
                            leftIcon: .init(icon: .outline3, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private let logo: IconImage = {
        let icon = IconImage(icon: .logo, size: .size120)
        return icon
    }()
    
    private let LoginTitle: Title = {
        let title = Title(text: StandartLanguage.titleLoginScreen, size: .meb36)
        return title
    }()
    
    private lazy var loginTextField: TextField = {
        let textfiled = TextField(name: StandartLanguage.loginTextFieldNameLoginScreen,
                                  shadowText: StandartLanguage.loginTextFieldShadowTextLoginScreen,
                                  error: StandartLanguage.loginTextFieldErrorLoginScreen)
        return textfiled
    }()
    
    private lazy var passwordTextField: TextField = {
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
        button.setTitle(StandartLanguage.signUpButtonLoginScreen, for: .normal)
        button.titleLabel?.font = .fourthTextFont
        button.setTitleColor(StandartColors.textErrorColor, for: .normal)
        button.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: System override Functions
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromAllNotifications()
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
        addSubViewInView()
        addLayoutSubviews()
        
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
        
        initializeHideKeyboard()
        self.view.backgroundColor = StandartColors.firstLoginBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    //MARK: Personal Functions
    private func addLayoutSubviews() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            header.topAnchor.constraint(equalTo: scrollView.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: header.bottomAnchor, constant: CGFloat.standartIdentConstant - 6),
            
            LoginTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            LoginTitle.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: CGFloat.standartIdentConstant + 8),
            
            loginTextField.topAnchor.constraint(equalTo: LoginTitle.bottomAnchor, constant: CGFloat.minimumIdentConstant),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: CGFloat.minimumIdentConstant),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: CGFloat.minimumIdentConstant + 2),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: CGFloat.standartIdentConstant - 9)
        ])
        //Изменяем размер scroll view, чтобы он мог скролиться, только когда клавиатура активирована
        scrollView.contentSize = CGSize(width: view.frame.width * 0.9, height: view.frame.height * 0.9)
    }
    
    private func addSubViewInView() {
        let array = [header, logo, LoginTitle, loginTextField,
                     passwordTextField, signInButton, signUpButton]
        
        [scrollView].forEach{ view.addSubview($0)}
        array.forEach{ scrollView.addSubview($0)}
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
        playSound(name: .openController)
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

extension LoginViewController: UIScrollViewDelegate {
    
    //Инициализируем клавиатуру
    private func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc
    private func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
    func subscribeToNotification(_ notification: NSNotification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: notification, object: nil)
    }
    
    func unsubscribeFromAllNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShowOrHide(notification: NSNotification) {
        
        if let userInfo = notification.userInfo,
           let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey],
           let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey],
           let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {
            
            let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)
            let keyboardOverlap = scrollView.frame.maxY - endRect.origin.y
            
            scrollView.contentInset.bottom = keyboardOverlap

            scrollView.verticalScrollIndicatorInsets.bottom = keyboardOverlap
            scrollView.horizontalScrollIndicatorInsets.bottom = keyboardOverlap
            
            let duration = (durationValue as AnyObject).doubleValue
            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))
            UIView.animate(withDuration: duration ?? TimeInterval.init(),
                           delay: 0,
                           options: options,
                           animations: {
                                self.view.layoutIfNeeded()
                            },
                           completion: nil)
        }
    }
}
