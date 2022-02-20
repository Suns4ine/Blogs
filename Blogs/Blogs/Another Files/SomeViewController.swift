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
                            leftIcon: .init(icon: .none, size: .size24),
                            rightIcon: .init(icon: .none, size: .size24))
        return header
    }()
    
    private let avatar: Avatar = {
        let avatar = Avatar(image: UIImage(named: "peep-2"), size: .size100)
        avatar.addTarget(self, action: #selector(backController))
        return avatar
    }()
    
    private let twoButons: TwoButtons = {
        let buttons = TwoButtons(stringLeading: "назад", stringTrailing: "тоже назад")
        buttons.addLeadingButtonTarget(self, action: #selector(backController))
        buttons.addTrailingButtonTarget(self, action: #selector(backController))
        return buttons
    }()
    
    private lazy var toggleSwitchButton: ToggleButton = {
       let swiftySwitch = ToggleButton()
        swiftySwitch.addTarget(self, action: #selector(backController), for: .touchUpInside)
        swiftySwitch.translatesAutoresizingMaskIntoConstraints = false
        return swiftySwitch
    }()
    
    private let alert: Alert = {
        let alert = Alert()
        return alert
    }()
    
    
    //MARK: Titles
    
    private let bigTitle: Title = {
        let title = Title(text: "Если ты видишь этот экран, то значит что-то пошло не так", size: .meb27)
        return title
    }()
    
    @objc
    func backController() {
        if toggleSwitchButton.flag {
            debugPrint(toggleSwitchButton.flag)
        } else {
            debugPrint(toggleSwitchButton.flag)
        }
        //self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .firstSunnyRed
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        [twoButons, headerView, avatar, bigTitle, toggleSwitchButton, alert].forEach {
            view.addSubview($0)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            twoButons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            twoButons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            twoButons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),

            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            bigTitle.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            bigTitle.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            bigTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bigTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            toggleSwitchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggleSwitchButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 10),
            
            alert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
          //  alert.heightAnchor.constraint(equalToConstant: 100),
            //alert.widthAnchor.constraint(equalToConstant: 200),
//            swiftySwitch.heightAnchor.constraint(equalToConstant: 36),
//            swiftySwitch.widthAnchor.constraint(equalToConstant: 60)

        ])
    }
}
