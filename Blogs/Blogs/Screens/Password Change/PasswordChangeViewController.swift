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

    //MARK: Объявление переменных
    private let header: Header = {
        let header = Header(title: "Пароль", leftIcon: .init(icon: .outline2, size: .size48), rightIcon: .init(icon: .none, size: .size24))
        return header
    }()
    
    private let oldPasswordTextfield: TextField = {
        let textfield = TextField(name: "oldPasswordTextfield", shadowText: "", error: "oldPasswordTextfield")
        return textfield
    }()
    
    private let newPasswordTextfield: TextField = {
        let textfield = TextField(name: "newPasswordTextfield", shadowText: "", error: "newPasswordTextfield")
        return textfield
    }()

    private let repeatPasswordTextfield: TextField = {
        let textfield = TextField(name: "repeatPasswordTextfield", shadowText: "", error: "repeatPasswordTextfield")
        return textfield
    }()

    private let saveButton: FirstBigButton = {
        let button = FirstBigButton(text: "saveButton")
        return button
    }()
    
    init(output: PasswordChangeViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, oldPasswordTextfield, newPasswordTextfield, repeatPasswordTextfield, saveButton].forEach{ view.addSubview($0)}
        
        self.view.backgroundColor = StandartColors.settingBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
    }
}

extension PasswordChangeViewController: PasswordChangeViewInput {
}