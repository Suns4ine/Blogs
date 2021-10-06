//
//  DraftBlogsViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class DraftBlogsViewController: UIViewController {
	private let output: DraftBlogsViewOutput

    //MARK: Create Variable
    private var section: StandartBlogSectionRowPresentable = StandartBlogSectionViewModel() {
        didSet {
            emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleDraftBlogsScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: StandartLanguage.emptyArrayTitleDraftBlogsScreen,
                          size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    private let draftTableView: UITableView = {
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
    init(output: DraftBlogsViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViewInView()
        addLayoutSubviews()
        
        self.view.backgroundColor = StandartColors.standartBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        
        output.fetchBlogsCell()
        
        draftTableView.delegate = self
        draftTableView.dataSource = self
        draftTableView.register(StandartBlogTableViewCell.self,
                                forCellReuseIdentifier: StandartBlogTableViewCell.identifier)
    }
    
    //MARK: Personal Functions
    private func addLayoutSubviews() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            draftTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 4),
            draftTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            draftTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            draftTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyArrayTitle.topAnchor.constraint(equalTo: refreshControl.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    private func addSubViewInView() {
        [header, draftTableView, emptyArrayTitle].forEach{ view.addSubview($0)}
        draftTableView.addSubview(refreshControl)
    }
    
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

extension DraftBlogsViewController: DraftBlogsViewInput {
    func clearTableCell(at indexPath: IndexPath) {
        section.rows.remove(at: indexPath.row)
        draftTableView.deleteRows(at: [indexPath], with: .right)
    }
    
    func reloadData(for section: StandartBlogSectionViewModel) {
        self.section = section
        draftTableView.reloadData()
    }
}

extension DraftBlogsViewController: UITableViewDelegate, UITableViewDataSource {
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
        output.didTapDraftTableViewCell(at: indexPath)
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
