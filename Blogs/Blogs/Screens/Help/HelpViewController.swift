//
//  HelpViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class HelpViewController: UIViewController {
	private let output: HelpViewOutput

    //MARK: Create Variable
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleHelpScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let text: Text = {
        let text = Text(text: StandartLanguage.textHelpScreen,
                        size: .mm15)
        text.editAligent(aligent: .natural)
        text.editScrollEnabled(edit: true)
        return text
    }()
    
    private let emptyArrayTitle: Title = {
        let title = Title(text: StandartLanguage.emptyArrayTitleHelpScreen,
                          size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    //MARK: System override Functions
    init(output: HelpViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, text, emptyArrayTitle].forEach{ view.addSubview($0)}
        
        emptyArrayTitle.isHidden = text.textView.text.isEmpty ? false : true
        self.view.backgroundColor = StandartColors.settingBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            text.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 15),
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            text.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            emptyArrayTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    //MARK: Personal Functions
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
}

extension HelpViewController: HelpViewInput {
}
