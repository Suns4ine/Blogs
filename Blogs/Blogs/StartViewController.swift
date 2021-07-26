//
//  ViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.07.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    private lazy var firstButton: FirstBigButton = {
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
        
        view.addSubview(image)
        view.addSubview(firstButton)
        view.addSubview(firstSmallButton)
        view.addSubview(secondBigButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //firstButton.heightAnchor.constraint(equalToConstant: 60),
            firstButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            firstButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            firstSmallButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 30),
            //firstSmallButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            //firstSmallButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            secondBigButton.topAnchor.constraint(equalTo: firstSmallButton.bottomAnchor, constant: 30),
            secondBigButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            secondBigButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
        ])
        
        debugPrint(firstButton.frame.height)
    }
}

