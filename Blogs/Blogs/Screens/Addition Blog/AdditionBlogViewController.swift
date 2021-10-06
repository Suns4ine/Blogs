//
//  AdditionBlogViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class AdditionBlogViewController: UIViewController {
	private let output: AdditionBlogViewOutput

    //MARK: Create Variable
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleAdditionBlogScreen,
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
    
    private let nextButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: StandartLanguage.nextButtonAdditionBlogScreen)
        button.addTarget(self, action: #selector(tapNextButton))
        return button
    }()
    
    private let blogTitleSubTitle : SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.blogTitleSubTitleAdditionBlogScreen,
                                size: .meb24)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let blogTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = StandartColors.borderColor.cgColor
        view.backgroundColor = StandartColors.standartBackgroundColor
        return view
    }()
    
    private let blogTitleText: Text = {
        let text = Text(text: StandartLanguage.blogTitleTextAdditionBlogScreen,
                        size: .mm17)
        text.editScrollEnabled(edit: true)
        text.editAligent(aligent: .natural)
        text.editWorkInText(edit: true)
        text.editColor(color: StandartColors.enteredTextColor)
        return text
    }()
    
    private let blogTitleErrorSubTitle: SubTitle = {
        let text = SubTitle(text: StandartLanguage.blogTitleErrorSubTitleAdditionBlogScreen,
                            size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.textErrorColor)
        return text
    }()
    
    private let tagSubTitle : SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.tagSubTitleAdditionBlogScreen,
                                size: .meb24)
        subtitle.editAligent(aligent: .left)
        return subtitle
    }()
    
    private let tagView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = StandartColors.borderColor.cgColor
        view.backgroundColor = StandartColors.standartBackgroundColor
        return view
    }()
    
    private let tagText: Text = {
        let text = Text(text: StandartLanguage.tagTextAdditionBlogScreen,
                        size: .mm17)
        text.editScrollEnabled(edit: true)
        text.editAligent(aligent: .natural)
        text.editWorkInText(edit: true)
        text.editColor(color: StandartColors.enteredTextColor)
        return text
    }()
    
    private let tagErrorSubTitle: SubTitle = {
        let text = SubTitle(text: StandartLanguage.tagErrorSubTitleAdditionBlogScreen,
                            size: .mm15)
        text.editAligent(aligent: .left)
        text.editColor(color: StandartColors.textErrorColor)
        return text
    }()
    
    //MARK: System override Functions
    init(output: AdditionBlogViewOutput) {
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
        [scrollView].forEach{ view.addSubview($0)}
        addSubViewInScrollView()
        addLayoutSubviews()
        
        output.setupText()
        
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
        initializeHideKeyboard()
        
        self.view.backgroundColor = StandartColors.createBlogBackgroundColor
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
            
            nextButton.centerYAnchor.constraint(equalTo: header.leftIcon.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            blogTitleSubTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            blogTitleSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            blogTitleSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            blogTitleSubTitle.heightAnchor.constraint(equalToConstant: 28),
            
            blogTitleView.topAnchor.constraint(equalTo: blogTitleSubTitle.bottomAnchor, constant: 5),
            blogTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            blogTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            blogTitleView.heightAnchor.constraint(equalToConstant: 168),
            
            blogTitleText.topAnchor.constraint(equalTo: blogTitleView.topAnchor, constant: 14),
            blogTitleText.bottomAnchor.constraint(equalTo: blogTitleView.bottomAnchor, constant: -14),
            blogTitleText.leadingAnchor.constraint(equalTo: blogTitleView.leadingAnchor, constant: 16),
            blogTitleText.trailingAnchor.constraint(equalTo: blogTitleView.trailingAnchor, constant: -16),
            
            blogTitleErrorSubTitle.topAnchor.constraint(equalTo: blogTitleView.bottomAnchor, constant: 5),
            blogTitleErrorSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            blogTitleErrorSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            blogTitleErrorSubTitle.heightAnchor.constraint(equalToConstant: 20),
            
            tagSubTitle.topAnchor.constraint(equalTo: blogTitleErrorSubTitle.bottomAnchor, constant: 5),
            tagSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            tagSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tagSubTitle.heightAnchor.constraint(equalToConstant: 28),
            
            tagView.topAnchor.constraint(equalTo: tagSubTitle.bottomAnchor, constant: 5),
            tagView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tagView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tagView.heightAnchor.constraint(equalToConstant: 168),
            
            tagText.topAnchor.constraint(equalTo: tagView.topAnchor, constant: 14),
            tagText.bottomAnchor.constraint(equalTo: tagView.bottomAnchor, constant: -14),
            tagText.leadingAnchor.constraint(equalTo: tagView.leadingAnchor, constant: 16),
            tagText.trailingAnchor.constraint(equalTo: tagView.trailingAnchor, constant: -16),
            
            tagErrorSubTitle.topAnchor.constraint(equalTo: tagView.bottomAnchor, constant: 5),
            tagErrorSubTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            tagErrorSubTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tagErrorSubTitle.heightAnchor.constraint(equalToConstant: 20),
        ])
        //Изменяем размер scroll view, чтобы он мог скролиться, только когда клавиатура активирована
        scrollView.contentSize = CGSize(width: view.frame.width * 0.9, height: view.frame.height * 0.9)
    }
    
    private func addSubViewInScrollView() {
        let array = [header, nextButton, blogTitleSubTitle, tagSubTitle,
                     blogTitleView, blogTitleErrorSubTitle, tagView,
                     tagErrorSubTitle, blogTitleText, tagText]
        
        array.forEach{ scrollView.addSubview($0)}
    }
    
    @objc
    private func tapBackButton() {
        output.didFinishNameText(text: blogTitleText.textView.text)
        output.didFinishTagNameText(text: tagText.textView.text)
        output.didTapBackButton()
    }
    
    @objc
    private func tapNextButton() {
        output.didFinishNameText(text: blogTitleText.textView.text)
        output.didFinishTagNameText(text: tagText.textView.text)
        output.didTapNextButton()
    }
}

extension AdditionBlogViewController: AdditionBlogViewInput {
    func showTitle(text: String) {
        blogTitleText.editText(text: text)
    }
    
    func showTags(text: String) {
        tagText.editText(text: text)
    }
    
    func showErrorName(text: String) {
        blogTitleErrorSubTitle.editText(text: text)
    }
    
    func showErrorTagName(text: String) {
        tagErrorSubTitle.editText(text: text)
    }
    
}

extension AdditionBlogViewController {
    
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
                           },
                           completion: nil)
        }
    }
}
