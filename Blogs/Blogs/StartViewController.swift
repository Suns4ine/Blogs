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
        let button = SecondBigButton(text: "Вторая", icon: .email)
        return button
    }()
    
    private let thirdBigButton: ThirdBigButton = {
        let button = ThirdBigButton(text: "Третья")
        button.addSelector(self, action: #selector(bee))
        return button
    }()
    
    private let thirdSmallButton: ThirdSmallButton = {
        let button = ThirdSmallButton(text: "|")//"четвертая")
        button.addSelector(self, action: #selector(bee))
        return button
    }()
    
    private let twoButons: TwoButtons = {
        let buttons = TwoButtons(stringLeading: "левая", stringTrailing: "правая")
        buttons.addLeadingButtonSelector(self, action: #selector(bee))
        buttons.addTrailingButtonSelector(self, action: #selector(mee))
        return buttons
    }()
    
    
    @objc
    func mee() {
        debugPrint(456)
    }
    
    @objc
    func bee() {
        debugPrint(123)
    }

    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "peep-sitting-2")
        imageView.frame = CGRect(x: 100, y: 100, width: 206, height: 285)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .firstBlue
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //view.addSubview(image)
        view.addSubview(firstButton)
        view.addSubview(firstSmallButton)
        view.addSubview(secondBigButton)
        view.addSubview(thirdBigButton)
        view.addSubview(thirdSmallButton)
        view.addSubview(twoButons)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
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
            
            twoButons.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            twoButons.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            twoButons.bottomAnchor.constraint(equalTo: firstButton.topAnchor, constant: -30),
        ])
        
        //debugPrint(thirdBigButton.frame.height)
    }
}

