//
//  ViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.07.2021.
//

import UIKit

class StartViewController: UIViewController, TextFieldDelegate {
    func action(text: String) {
        textField.editErrorText(text: text)
    }
    
    
    private let headerView: Header = {
        let header = Header(title: "Заголовок", leftIcon: .init(icon: .bookmark, size: .small), rightIcon: .init(icon: .bold, size: .standart))
        header.addLeftIconTarget(self, action: #selector(bee))
        header.addRightIconTarget(self, action: #selector(mee))
        header.backgroundColor = .firstYellow
        return header
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: UIImage(named: "peep-2"), size: .standart)
        avatar.addTarget(self, action: #selector(bee))
        return avatar
    }()
    
    private lazy var textField: TextField = {
        let textField = TextField(name: "Верхняя", shadowText: "Средняя", error: "Нижняя")
        textField.delegate = self
        return textField
    }()
    
    private let firstButton: FirstBigButton = {
        let button = FirstBigButton(text: "Регистрация")
        button.addTarget(self, action: #selector(bee), for: .touchUpInside)
        return button
    }()
    
    private let firstSmallButton: FirstSmallButton = {
        let button = FirstSmallButton(text: "Login")
        return button
    }()
    
    private let secondBigButton: SecondBigButton = {
        let button = SecondBigButton(text: "Вторая", icon: .mail)
        button.newButtonColor(color: StandartColors.twitterColor)
        return button
    }()
    
    private let thirdBigButton: ThirdBigButton = {
        let button = ThirdBigButton(text: "Третья")
        button.addTarget(self, action: #selector(bee))
        return button
    }()
    
    private let thirdSmallButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: "четвертая")
        button.addTarget(self, action: #selector(bee))
        return button
    }()
    
    private let twoButons: TwoButtons = {
        let buttons = TwoButtons(stringLeading: "левая", stringTrailing: "правая")
        buttons.addLeadingButtonTarget(self, action: #selector(bee))
        buttons.addTrailingButtonTarget(self, action: #selector(mee))
        return buttons
    }()
    
    //MARK: Titles
    
    private let bigTitle: Title = {
        let title = Title(text: "Big Title", size: .big)
        return title
    }()
    
    private let standartTitle: Title = {
        let title = Title(text: "Standart Title", size: .standart)
        return title
    }()
    
    private let bigSubTitle: SubTitle = {
        let title = SubTitle(text: "Big Sub Title", size: .big)
        return title
    }()
    
    private let standartSubTitle: SubTitle = {
        let title = SubTitle(text: "Standart Sub Title", size: .standart)
        return title
    }()
    
    private let widerLittleSubTitle: SubTitle = {
        let title = SubTitle(text: "Wider Small Sub Title", size: .widerLittle)
        return title
    }()
    
    private let narrowerLittleSubTitle: SubTitle = {
        let title = SubTitle(text: "Narrower Little Sub Title", size: .narrowerLittle)
        return title
    }()
    
    private let smallSubTitle: SubTitle = {
        let title = SubTitle(text: "Small Sub Title", size: .small)
        return title
    }()
    
    private let textView: Text = {
        let text = Text(text:
                            """
1Один два три четыре пять шесть семь восемь девять десять оддинадцать
        2Один два три четыре пять шесть семь восемь девять десять оддинадцать
        3Один два три четыре пять шесть семь восемь девять десять оддинадцать
        4Один два три четыре пять шесть семь восемь девять десять оддинадцать
""", size: .big)
        text.editColor(color: .firstYellow
)
        return text
    }()
    
    @objc
    func mee(_ sender: UIButton) {
        debugPrint("правая")
        textField.editErrorText(text: "Ошибка Ошибка Ошибка")
        let arr: [TextProtocol] = [bigTitle, standartTitle, bigSubTitle,
                                  standartSubTitle, widerLittleSubTitle,
                                  narrowerLittleSubTitle, smallSubTitle,
                                  textView]
       var numb = 1
        for label in arr {
            label.editText(text: "Новый текст \(numb)")
            label.editColor(color: [UIColor.firstPink, UIColor.firstGray, UIColor.firstSeaWave, UIColor.firstYellow, UIColor.firstBlack, UIColor.firstSunnyRed].randomElement() ?? UIColor.firstYellow)
            numb += 1
       }
        
        textView.editWorkInText(edit: true)
        //bigTitle.editTextTitle(text: "Ничего")
    }
    
    @objc
    func bee() {
        debugPrint("Левая")
    }

    let imageOne: IconImage = {
        let image = IconImage(icon: .outline1, size: .biggest)
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .firstBlue
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
       // [ firstButton, firstSmallButton, secondBigButton,
       //   thirdBigButton, thirdSmallButton,
        // bigTitle, standartTitle, bigSubTitle,
        //standartSubTitle, widerLittleSubTitle, narrowerLittleSubTitle,
        //smallSubTitle, textView,
        [twoButons, headerView, avatar, textField].forEach {
            view.addSubview($0)
        }
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            twoButons.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            twoButons.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            twoButons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            textField.bottomAnchor.constraint(equalTo: avatar.topAnchor, constant: -20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
//            smallSubTitle.bottomAnchor.constraint(equalTo: twoButons.topAnchor, constant:  -30),
//            smallSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            narrowerLittleSubTitle.bottomAnchor.constraint(equalTo: smallSubTitle.topAnchor, constant:  -30),
//            narrowerLittleSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            widerLittleSubTitle.bottomAnchor.constraint(equalTo: narrowerLittleSubTitle.topAnchor, constant:  -30),
//            widerLittleSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            standartSubTitle.bottomAnchor.constraint(equalTo: widerLittleSubTitle.topAnchor, constant:  -30),
//            standartSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            bigSubTitle.bottomAnchor.constraint(equalTo: standartSubTitle.topAnchor, constant:  -30),
//            bigSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            standartTitle.bottomAnchor.constraint(equalTo: bigSubTitle.topAnchor, constant:  -30),
//            standartTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            bigTitle.bottomAnchor.constraint(equalTo: standartTitle.topAnchor, constant:  -30),
//            bigTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            textView.bottomAnchor.constraint(equalTo: bigTitle.topAnchor, constant:  -30),
//            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30)
        ])
        
      //  debugPrint(imageOne.frame)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        self.keyboardWillHide()
        super.touchesBegan(touches, with: event)
    }
    
    @objc
    private func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }

    @objc
    private func keyboardWillChange(notification: NSNotification) {
        
        if self.view.frame.origin.y == 0 {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if textField.isFirstResponder {
                    self.view.frame.origin.y = -keyboardSize.height
                }
            }
        }
    }
}


/*
 firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
 firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
 firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
 firstButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
 
 firstSmallButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 30),
 firstSmallButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
 
 thirdBigButton.topAnchor.constraint(equalTo: firstSmallButton.bottomAnchor, constant: 30),
 thirdBigButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
 thirdBigButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
 thirdBigButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
 
 thirdSmallButton.topAnchor.constraint(equalTo: thirdBigButton.bottomAnchor, constant: 30),
 thirdSmallButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

 secondBigButton.topAnchor.constraint(equalTo: thirdSmallButton.bottomAnchor, constant: 30),
 secondBigButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
 secondBigButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
 */
