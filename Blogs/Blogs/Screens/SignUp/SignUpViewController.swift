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

    //MARK: Create Variable
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleSignUpScreen,
                            leftIcon: .init(icon: .outline1, size: .size48),
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
    
    private let tagnameTextField: TextField = {
        let textfiled = TextField(name: StandartLanguage.tagnameTextFieldNameSignUpScreen,
                                  shadowText: StandartLanguage.tagnameTextFieldShadowTextSignUpScreen,
                                  error: StandartLanguage.tagnameTextFieldErrorSignUpScreen)
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
    
    //MARK: System override Functions
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
        tagnameTextField.clearText()
        mailTextField.clearText()
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
        view.backgroundColor = StandartColors.firstLoginBackgroundColor
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
            
            signUpTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 12),
            signUpTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            text.topAnchor.constraint(equalTo: signUpTitle.bottomAnchor, constant: 12),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            tagnameTextField.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 15),
            tagnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tagnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            mailTextField.topAnchor.constraint(equalTo: tagnameTextField.bottomAnchor, constant: 5),
            mailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            passwordTextField.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 7),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        //Изменяем размер scroll view, чтобы он мог скролиться, только когда клавиатура активирована
        scrollView.contentSize = CGSize(width: view.frame.width * 0.9, height: view.frame.height * 0.9)
    }
    
    private func addSubViewInView() {
        let array =  [header, signUpTitle, text,
                      tagnameTextField, mailTextField,
                      passwordTextField, registerButton]
        [scrollView].forEach{ view.addSubview($0)}
        array.forEach{ scrollView.addSubview($0)}
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapRegisterButton() {
        output.didFinishNameText(text: tagnameTextField.textField.text ?? "")
        output.didFinishMailText(text: mailTextField.textField.text ?? "")
        output.didFinishPasswordText(text: passwordTextField.password)
        output.didTapRegisterButton()
    }
}

extension SignUpViewController: SignUpViewInput {
    func showErrorName(text: String) {
        tagnameTextField.editErrorText(text: text)
    }
    
    func showErrorMail(text: String) {
        mailTextField.editErrorText(text: text)
    }
    
    func showErrorPassword(text: String) {
        passwordTextField.editErrorText(text: text)
    }
    
}

extension SignUpViewController {
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
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
                           })
        }
    }
}
