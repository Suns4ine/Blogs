//
//  ChoiceLanguageViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class ChoiceLanguageViewController: UIViewController {
	private let output: ChoiceLanguageViewOutput

    //MARK: Create Variable
    private var section: ChoiceSectionRowPresentable = ChoiceSectionViewModel() {
        didSet {
            emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleChoiceLanguageScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let languageTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.alwaysBounceVertical = false
        return table
    }()
    
    private let emptyArrayTitle: Title = {
        let title = Title(text: StandartLanguage.emptyArrayTitleChoiceLanguageScreen,
                          size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    //MARK: System override Functions
    init(output: ChoiceLanguageViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, languageTableView, emptyArrayTitle].forEach{ view.addSubview($0)}
        
        emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        self.view.backgroundColor = StandartColors.settingBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        output.fetchChoicesCell()
        
        languageTableView.delegate = self
        languageTableView.dataSource = self
        languageTableView.register(ChoiceTableViewCell.self, forCellReuseIdentifier: ChoiceTableViewCell.identifier)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            languageTableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            languageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            languageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            languageTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
    
    @objc
    private func tapLanguageTableViewCell(_ button: UIButton) {
        output.didTapLanguageTableViewCell(at: button.tag)
    }
}

extension ChoiceLanguageViewController: ChoiceLanguageViewInput {
    
    //Изменение языка происходит только после перезагрузки приложения, поэтому мы оповещаем
    func showNotification() {
        let alert = UIAlertController(title: "Важно",
                                      message: "Для смены языка в приложении, перезагрузите его",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func reloadData(for section: ChoiceSectionViewModel) {
        self.section = section
        languageTableView.reloadData()
    }
    
}

extension ChoiceLanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.cellIdentifier,
                for: indexPath) as? ChoiceTableViewCell else { return .init() }
        
        cell.viewModel = viewModel
        cell.addTarget(self, action: #selector(tapLanguageTableViewCell(_:)))
        cell.addTag(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(section.rows[indexPath.row].cellHeight)
    }
}
 
