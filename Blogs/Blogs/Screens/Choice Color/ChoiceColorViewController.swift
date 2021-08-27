//
//  ChoiceColorViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class ChoiceColorViewController: UIViewController {
	private let output: ChoiceColorViewOutput

    //MARK: Объявлние переменных
    private var section: ChoiceSectionRowPresentable = ChoiceSectionViewModel() {
        didSet {
            emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleChoiceColorScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let colorTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.alwaysBounceVertical = false
        return table
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: StandartLanguage.emptyArrayTitleChoiceColorScreen,
                          size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    
    init(output: ChoiceColorViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, colorTableView, emptyArrayTitle].forEach{ view.addSubview($0)}
        
        emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        self.view.backgroundColor = StandartColors.settingBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        output.fetchChoicesCell()
        
        colorTableView.delegate = self
        colorTableView.dataSource = self
        colorTableView.register(ChoiceTableViewCell.self, forCellReuseIdentifier: ChoiceTableViewCell.identifier)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            colorTableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            colorTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            colorTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            emptyArrayTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapColorTableViewCell(_ button: UIButton) {
        output.didTapColorTableViewCell(at: button.tag)
    }
}

extension ChoiceColorViewController: ChoiceColorViewInput {
    func reloadData(for section: ChoiceSectionViewModel) {
        self.section = section
        colorTableView.reloadData()
    }
    
}

extension ChoiceColorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.cellIdentifier,
                for: indexPath) as? ChoiceTableViewCell else { return .init() }
        
        cell.viewModel = viewModel
        cell.addTarget(self, action: #selector(tapColorTableViewCell(_:)))
        cell.addTag(indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return section.rows[indexPath.row].cellHeight
    }
}
