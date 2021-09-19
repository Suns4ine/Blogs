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

    //MARK: Create Variable
    private var section: StandartBlogSectionRowPresentable = StandartBlogSectionViewModel() {
        didSet {
            emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleSavedScreen,
                            leftIcon: .init(icon: .alignJustify, size: .size24),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapSettingButton))
        return header
    }()
    
    private let emptyArrayTitle: Title = {
        let title = Title(text: StandartLanguage.emptyArrayTitleSavedScreen,
                          size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    private let savedTableView: UITableView = {
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
        savedTableView.addSubview(refreshControl)
        
        self.view.backgroundColor = StandartColors.standartBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        
        output.fetchBlogsCell()
        
        savedTableView.delegate = self
        savedTableView.dataSource = self
        savedTableView.register(StandartBlogTableViewCell.self, forCellReuseIdentifier: StandartBlogTableViewCell.identifier)
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
            savedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
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
    private func tapSettingButton() {
        output.didTapSettingButton()
    }
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
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
        output.didTapSavedTableViewCell(at: indexPath)
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

extension SavedViewController: SavedViewInput {
    func clearTableCell(at indexPath: IndexPath) {
        section.rows.remove(at: indexPath.row)
        savedTableView.deleteRows(at: [indexPath], with: .left)
    }
    
    func reloadData(for section: StandartBlogSectionViewModel) {
        self.section = section
        savedTableView.reloadData()
    }
    
}
