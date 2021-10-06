//
//  PasswordChangeViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class PasswordChangeViewController: UIViewController {
	private let output: PasswordChangeViewOutput

    //MARK: Create Variable
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitlePasswordChangeScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
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
    
    private let oldPasswordTextfield: TextField = {
        let textfield = TextField(name: StandartLanguage.oldPasswordTextfieldNamePasswordChangeScreen,
                                  shadowText: StandartLanguage.oldPasswordTextfieldShadowTextPasswordChangeScreen,
                                  error: StandartLanguage.oldPasswordTextfieldErrorPasswordChangeScreen)
        textfield.editSecureTextEntry(entry: true)
        return textfield
    }()
    
    private let newPasswordTextfield: TextField = {
        let textfield = TextField(name: StandartLanguage.newPasswordTextfieldNamePasswordChangeScreen,
                                  shadowText: StandartLanguage.newPasswordTextfieldShadowTextPasswordChangeScreen,
                                  error: StandartLanguage.newPasswordTextfieldErrorPasswordChangeScreen)
        textfield.editSecureTextEntry(entry: true)
        return textfield
    }()

    private let repeatPasswordTextfield: TextField = {
        let textfield = TextField(name: StandartLanguage.repeatPasswordTextfieldNamePasswordChangeScreen,
                                  shadowText: StandartLanguage.repeatPasswordTextfieldShadowTextPasswordChangeScreen,
                                  error: StandartLanguage.repeatPasswordTextfieldErrorPasswordChangeScreen)
        textfield.editSecureTextEntry(entry: true)
        return textfield
    }()

    private let saveButton: FirstBigButton = {
        let button = FirstBigButton(text: StandartLanguage.saveButtonPasswordChangeScreen)
        button.addTarget(self, action: #selector(tapSaveButton))
        return button
    }()
    
    //MARK: System override Functions
    init(output: PasswordChangeViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        self.view.backgroundColor = StandartColors.settingBackgroundColor
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
            
            oldPasswordTextfield.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 14),
            oldPasswordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            oldPasswordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            newPasswordTextfield.topAnchor.constraint(equalTo: oldPasswordTextfield.bottomAnchor, constant: 5),
            newPasswordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            newPasswordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            repeatPasswordTextfield.topAnchor.constraint(equalTo: newPasswordTextfield.bottomAnchor, constant: 5),
            repeatPasswordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            repeatPasswordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            saveButton.topAnchor.constraint(equalTo: repeatPasswordTextfield.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        //Изменяем размер scroll view, чтобы он мог скролиться, только когда клавиатура активирована
        scrollView.contentSize = CGSize(width: view.frame.width * 0.9, height: view.frame.height * 0.9)
    }
    
    private func addSubViewInView() {
        let array = [header, oldPasswordTextfield, newPasswordTextfield,
                     repeatPasswordTextfield, saveButton]
        [scrollView].forEach{ view.addSubview($0)}
        array.forEach{ scrollView.addSubview($0)}
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapSaveButton() {
        output.didFinishOldPasswordText(text: oldPasswordTextfield.password)
        output.didFinishNewPasswordText(text: newPasswordTextfield.password)
        output.didFinishRepeatPasswordText(text: repeatPasswordTextfield.password)
        output.didTapSaveButton()
    }
}

extension PasswordChangeViewController: PasswordChangeViewInput {
    func showErrorOldPassword(text: String) {
        oldPasswordTextfield.editErrorText(text: text)
    }
    
    func showErrorNewPassword(text: String) {
        newPasswordTextfield.editErrorText(text: text)
    }
    
    func showErrorRepeatPassword(text: String) {
        repeatPasswordTextfield.editErrorText(text: text)
    }
}

extension PasswordChangeViewController {
    
    //Инициализируем клавиатуру
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
