//
//  SomeViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 25.07.2021.
//

import UIKit

final class SomeViewController: UIViewController {
    
    private let headerView: Header = {
        let header = Header(title: "Error Screen",
                            leftIcon: .init(icon: .none, size: .small),
                            rightIcon: .init(icon: .none, size: .small))
        return header
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: UIImage(named: "peep-2"), size: .standart)
        avatar.addTarget(self, action: #selector(backController))
        return avatar
    }()
    
    private let twoButons: TwoButtons = {
        let buttons = TwoButtons(stringLeading: "назад", stringTrailing: "тоже назад")
        buttons.addLeadingButtonTarget(self, action: #selector(backController))
        buttons.addTrailingButtonTarget(self, action: #selector(backController))
        return buttons
    }()
    
    //MARK: Titles
    
    private let bigTitle: Title = {
        let title = Title(text: "Если ты видишь этот экран, то значит что-то пошло не так", size: .meb27)
        return title
    }()
    
    @objc
    func backController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .firstSunnyRed
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        [twoButons, headerView, avatar, bigTitle].forEach {
            view.addSubview($0)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            twoButons.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            twoButons.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            twoButons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),

            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            bigTitle.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            bigTitle.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            bigTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bigTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)

        ])
    }
}
