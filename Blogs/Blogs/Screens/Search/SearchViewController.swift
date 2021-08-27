//
//  SearchViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import UIKit

final class SearchViewController: UIViewController {
	private let output: SearchViewOutput

    //MARK: Объявлены переменные
    private var section: StandartBlogSectionRowPresentable = StandartBlogSectionViewModel() {
        didSet {
            emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleSearchScreen,
                            leftIcon: .init(icon: .alignJustify, size: .size24),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapSettingButton))
        return header
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.layer.cornerRadius = 16
        search.layer.borderWidth = 2
        search.layer.borderColor = StandartColors.borderColor.cgColor
        search.backgroundColor = StandartColors.standartBackgroundColor
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchTextField.backgroundColor = StandartColors.standartBackgroundColor
        search.searchTextField.attributedPlaceholder = NSAttributedString(string: StandartLanguage.searchTextFieldShadowTextSearchScreen,
                                                             attributes: [NSAttributedString.Key.foregroundColor : StandartColors.textForTextfieldBackgroundColor.withAlphaComponent(0.5)])
        
        search.backgroundImage = UIImage()
        search.layer.zPosition = 2
        search.setImage(UIImage(named: Icons.search.rawValue), for: .search, state: .normal)
        search.setImage(UIImage(named: Icons.cross.rawValue), for: .clear, state: .normal)
        search.searchTextField.tintColor = StandartColors.enteredTextColor
        search.searchTextField.textColor = StandartColors.enteredTextColor
        search.searchTextField.font = .secondTextFont
        search.barTintColor = StandartColors.standartBackgroundColor
        search.searchTextField.delegate = self
        return search
    }()
    
    private let shadowSearchBarView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = StandartColors.shadowColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: StandartLanguage.emptyArrayTitleSearchScreen,
                          size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    private let searchTableView: UITableView = {
        let table = UITableView()
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(output: SearchViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [header, searchTableView, emptyArrayTitle, shadowSearchBarView, searchBar].forEach{ view.addSubview($0)}
        
        self.view.backgroundColor = StandartColors.standartBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        
        output.fetchBlogsCell()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.register(StandartBlogTableViewCell.self,
                                 forCellReuseIdentifier: StandartBlogTableViewCell.identifier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: header.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            searchBar.heightAnchor.constraint(equalToConstant: 56),
            
            shadowSearchBarView.topAnchor.constraint(equalTo: searchBar.topAnchor, constant: 4),
            shadowSearchBarView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            shadowSearchBarView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            shadowSearchBarView.bottomAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 4),
            
            searchTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: -10),
            searchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyArrayTitle.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    @objc
    private func tapSettingButton() {
        output.didTapSettingButton()
    }
    
}

extension SearchViewController: SearchViewInput {
    func reloadData(for section: StandartBlogSectionViewModel) {
        self.section = section
        searchTableView.reloadData()
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.cellIdentifier,
                for: indexPath) as? StandartBlogTableViewCell else { return .init() }
        
        cell.viewModel = viewModel
        cell.ediTindentHeight(top: 22, bot: 2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return section.rows[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didTapSearchTableViewCell(at: indexPath)
    }
}
