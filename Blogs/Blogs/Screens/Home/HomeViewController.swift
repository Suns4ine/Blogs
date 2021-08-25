//
//  HomeViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import UIKit

final class HomeViewController: UIViewController {
	private let output: HomeViewOutput

    //MARK: Объявление переменных
    private var section: BlogSectionRowPresentable = BlogSectionViewModel() {
        didSet {
            emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: "Блоги",
                            leftIcon: .init(icon: .alignJustify, size: .size24),
                            rightIcon: .init(icon: .bell, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapSettingButton))
        header.addRightIconTarget(self, action: #selector(tapBellButton))
        return header
    }()
    
    private let blogsTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: "Здесь пока ничего нет", size: .meb36)
        title.sizeToFit()
        return title
    }()
    
    init(output: HomeViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, blogsTableView, emptyArrayTitle].forEach{ view.addSubview($0)}
        self.view.backgroundColor = StandartColors.standartBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        emptyArrayTitle.isHidden = section.rows.isEmpty ? false : true
        
        output.fetchBlogsCell()
        
        blogsTableView.delegate = self
        blogsTableView.dataSource = self
        blogsTableView.register(BlogsTableViewCell.self, forCellReuseIdentifier: BlogsTableViewCell.identifier)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            blogsTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8),
            blogsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blogsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blogsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            emptyArrayTitle.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 44),
            emptyArrayTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emptyArrayTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
     
    @objc
    private func tapSettingButton() {
        output.didTapSettingButton()
    }
    
    @objc
    private func tapBellButton() {
        output.didTapBellButton()
    }
    
    @objc
    private func tapAvatarTableViewCell( _ button: UIButton) {
        let buttonTag = button.tag
        output.didTapAvatarTableViewCell(at: buttonTag)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.cellIdentifier,
                for: indexPath) as? BlogsTableViewCell else { return .init() }
        
        cell.viewModel = viewModel
        cell.addTag(indexPath.row)
        cell.addTargetAvatar(self, action: #selector(tapAvatarTableViewCell))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return section.rows[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didTapBlogsTableViewCell(at: indexPath)
    }
}

extension HomeViewController: HomeViewInput {
    func reloadData(for section: BlogSectionViewModel) {
        self.section = section
        blogsTableView.reloadData()
    }
}
