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
    
    //MARK: Create Variable
    private var section: StandartBlogSectionRowPresentable = StandartBlogSectionViewModel() {
        didSet {
            emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleMyMoreBlogsScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        header.editTitleColor(color: StandartColors.anotherTitleColor)
        return header
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: StandartLanguage.emptyArrayTitleMyMoreBlogsScreen,
                          size: .meb36)
        title.editColor(color: StandartColors.anotherTitleColor)
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
    
    private let refreshControl: RefreshControl = {
        let refresh = RefreshControl()
        refresh.layer.zPosition = -1
        refresh.addTarget(self, action: #selector(refreshControlUpDate), for: .valueChanged)
        return refresh
    }()

    //MARK: System override Functions
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
        myBlogsTableView.addSubview(refreshControl)
        
        self.view.backgroundColor = StandartColors.myProfileColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        
        output.fetchBlogsCell()
        
        myBlogsTableView.delegate = self
        myBlogsTableView.dataSource = self
        myBlogsTableView.register(StandartBlogTableViewCell.self, forCellReuseIdentifier: StandartBlogTableViewCell.identifier)
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
            
            emptyArrayTitle.topAnchor.constraint(equalTo: refreshControl.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    //MARK: Personal Functions
    @objc
    private func refreshControlUpDate() {
        self.refreshControl.startAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.output.fetchBlogsCell()
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
}

extension MyMoreBlogsViewController: MyMoreBlogsViewInput {
    func clearTableCell(at indexPath: IndexPath) {
        section.rows.remove(at: indexPath.row)
        myBlogsTableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func reloadData(for section: StandartBlogSectionViewModel) {
        self.section = section
        myBlogsTableView.reloadData()
    }
    
}

extension MyMoreBlogsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.cellIdentifier,
                for: indexPath) as? StandartBlogTableViewCell else { return .init() }
        cell.viewModel = viewModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(section.rows[indexPath.row].cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didTapMyBlogsTableViewCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive,
                                        title: StandartLanguage.deleteActionStandartBlogCell) { [weak self] (action, view, completionHandler) in
                                            self?.output.deleteTableViewCell(at: indexPath)
                                            completionHandler(true)
        }
        
        action.backgroundColor = StandartColors.deleteActionColor
        action.image = UIImage(named: Icons.trash2.rawValue)
        
        return UISwipeActionsConfiguration(actions: [action])
    }
}
