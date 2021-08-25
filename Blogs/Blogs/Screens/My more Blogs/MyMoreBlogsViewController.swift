//
//  MyMoreBlogsViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import UIKit

final class MyMoreBlogsViewController: UIViewController {
	private let output: MyMoreBlogsViewOutput
    
    //MARK: Объявлены переменные
    private var draftArray: [String] = ["1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6", "1", "2", "3", "4", "5", "6"] {
        didSet {
            emptyArrayTitle.isHidden = draftArray.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: "Мои блоги",
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        header.editTitleColor(color: StandartColors.anotherTitleColor)
        return header
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: "Здесь пока ничего нет", size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    private let myBlogsTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    init(output: MyMoreBlogsViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        [header, myBlogsTableView, emptyArrayTitle].forEach{ view.addSubview($0)}
        
        self.view.backgroundColor = StandartColors.myProfileColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        emptyArrayTitle.isHidden = draftArray.isEmpty ? false : true
        
        myBlogsTableView.delegate = self
        myBlogsTableView.dataSource = self
        myBlogsTableView.register(SavedTableViewCell.self, forCellReuseIdentifier: SavedTableViewCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            myBlogsTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 4),
            myBlogsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myBlogsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myBlogsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
    private func tapMyBlogsTableViewCell() {
        output.didTapMyBlogsTableViewCell()
    }
}

extension MyMoreBlogsViewController: MyMoreBlogsViewInput {
}

extension MyMoreBlogsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return draftArray.count
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        tapMyBlogsTableViewCell()
    }
}
