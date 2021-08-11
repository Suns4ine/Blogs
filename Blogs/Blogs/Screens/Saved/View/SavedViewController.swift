//
//  SavedViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import UIKit

final class SavedViewController: UIViewController {
	private let output: SavedViewOutput

    //MARK: Объявлены переменные
    private var savedArray: [String] = ["1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6"] {
        didSet {
            emptyArrayTitle.isHidden = savedArray.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: "Понравившиеся",
                            leftIcon: .init(icon: .alignJustify, size: .small),
                            rightIcon: .init(icon: .none, size: .small))
        return header
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: "Здесь пока ничего нет", size: .big)
        title.sizeToFit()
        return title
    }()
    
    private let savedTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(output: SavedViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, savedTableView, emptyArrayTitle].forEach{ view.addSubview($0)}
        
        self.view.backgroundColor = StandartColors.standartBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        emptyArrayTitle.isHidden = savedArray.isEmpty ? false : true
        
        savedTableView.delegate = self
        savedTableView.dataSource = self
        savedTableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            savedTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 4),
            savedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            savedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            savedTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            emptyArrayTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: SavedTableViewCell.identifier,
                for: indexPath) as? SavedTableViewCell else { return .init() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 168
    }
}

extension SavedViewController: SavedViewInput {
}
