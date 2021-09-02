//
//  AnotherMoreBlogsViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import UIKit

final class AnotherMoreBlogsViewController: UIViewController {
	private let output: AnotherMoreBlogsViewOutput
    
    //MARK: Объявлены переменные
    private var section: StandartBlogSectionRowPresentable = StandartBlogSectionViewModel() {
        didSet {
            emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleAnotherMoreBlogsScreen,
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        header.editTitleColor(color: StandartColors.anotherTitleColor)
        return header
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: StandartLanguage.emptyArrayTitleAnotherMoreBlogsScreen,
                          size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    private let anotherBlogsTableView: UITableView = {
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
    
    init(output: AnotherMoreBlogsViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        [header, anotherBlogsTableView, emptyArrayTitle].forEach{ view.addSubview($0)}
        anotherBlogsTableView.addSubview(refreshControl)
        
        self.view.backgroundColor = StandartColors.anotherProfileColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        
        output.fetchBlogsCell()
        
        anotherBlogsTableView.delegate = self
        anotherBlogsTableView.dataSource = self
        anotherBlogsTableView.register(StandartBlogTableViewCell.self,
                                       forCellReuseIdentifier: StandartBlogTableViewCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            anotherBlogsTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 4),
            anotherBlogsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            anotherBlogsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            anotherBlogsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyArrayTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
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

extension AnotherMoreBlogsViewController: AnotherMoreBlogsViewInput {
    func reloadData(for section: StandartBlogSectionViewModel) {
        self.section = section
        anotherBlogsTableView.reloadData()
    }
    
}

extension AnotherMoreBlogsViewController: UITableViewDelegate, UITableViewDataSource {
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
        return section.rows[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didTapAnotherBlogsTableViewCell(at: indexPath)
    }
}

