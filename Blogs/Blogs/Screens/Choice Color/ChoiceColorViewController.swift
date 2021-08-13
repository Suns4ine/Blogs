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
    private var colorArray: [String] = ["", "", "", ""] {
        didSet {
            emptyArrayTitle.isHidden = colorArray.isEmpty ? false : true
        }
    }
    
    private let header: Header = {
        let header = Header(title: "Расцветка",
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        return header
    }()
    
    private let colorTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.alwaysBounceVertical = false
        return table
    }()
    
    private lazy var emptyArrayTitle: Title = {
        let title = Title(text: "Здесь пока ничего нет", size: .meb36)
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
        
        emptyArrayTitle.isHidden = colorArray.isEmpty ? false : true
        self.view.backgroundColor = StandartColors.settingBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
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
}

extension ChoiceColorViewController: ChoiceColorViewInput {
}

extension ChoiceColorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: ChoiceTableViewCell.identifier,
                for: indexPath) as? SavedTableViewCell else { return .init() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}
