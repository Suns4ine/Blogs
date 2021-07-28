//
//  ViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.07.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    private let firstButton: FirstBigButton = {
        let button = FirstBigButton(text: "Регистрация")
        button.addSelector(self, action: #selector(bee), for: .touchUpInside)
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
        button.addSelector(self, action: #selector(bee))
        return button
    }()
    
    private let thirdSmallButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: "четвертая")
        button.addSelector(self, action: #selector(bee))
        return button
    }()
    
    private let twoButons: TwoButtons = {
        let buttons = TwoButtons(stringLeading: "левая", stringTrailing: "правая")
        buttons.addLeadingButtonSelector(self, action: #selector(bee))
        buttons.addTrailingButtonSelector(self, action: #selector(mee))
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
    
    @objc
    func mee(_ sender: UIButton) {
        
        let arr: [TextProtocol] = [bigTitle, standartTitle, bigSubTitle,
                                  standartSubTitle, widerLittleSubTitle,
                                  narrowerLittleSubTitle, smallSubTitle]
       var numb = 1
        for label in arr {
            label.editTextTitle(text: "Новый текст \(numb)")
            label.editTitleColor(color: [UIColor.firstPink, UIColor.firstGray, UIColor.firstSeaWave, UIColor.firstYellow].randomElement() ?? UIColor.firstYellow)
            numb += 1
       }
        //bigTitle.editTextTitle(text: "Ничего")
    }
    
    @objc
    func bee() {
        debugPrint(123)
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
         [twoButons, bigTitle, standartTitle, bigSubTitle, standartSubTitle, widerLittleSubTitle, narrowerLittleSubTitle, smallSubTitle].forEach {
            view.addSubview($0)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            twoButons.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            twoButons.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            twoButons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            smallSubTitle.bottomAnchor.constraint(equalTo: twoButons.topAnchor, constant:  -30),
            smallSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            narrowerLittleSubTitle.bottomAnchor.constraint(equalTo: smallSubTitle.topAnchor, constant:  -30),
            narrowerLittleSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            widerLittleSubTitle.bottomAnchor.constraint(equalTo: narrowerLittleSubTitle.topAnchor, constant:  -30),
            widerLittleSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            standartSubTitle.bottomAnchor.constraint(equalTo: widerLittleSubTitle.topAnchor, constant:  -30),
            standartSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bigSubTitle.bottomAnchor.constraint(equalTo: standartSubTitle.topAnchor, constant:  -30),
            bigSubTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            standartTitle.bottomAnchor.constraint(equalTo: bigSubTitle.topAnchor, constant:  -30),
            standartTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bigTitle.bottomAnchor.constraint(equalTo: standartTitle.topAnchor, constant:  -30),
            bigTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bigTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//            bigTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            //firstTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
        ])
        
        debugPrint(imageOne.frame)
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
