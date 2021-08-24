//
//  SettingViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import UIKit

final class SettingViewController: UIViewController {
	private let output: SettingViewOutput

    //MARK: Объявление переенных
    private var settingArray: [Int] = [1, 1, 2, 2, 2, 2, 3, 3, 4]
    
    private let header: Header = {
        let header = Header(title: "Настройки",
                            leftIcon: .init(icon: .outline2, size: .size48),
                            rightIcon: .init(icon: .none, size: .size24))
        header.addLeftIconTarget(self, action: #selector(tapBackButton))
        return header
    }()
    
    private let settingTableView: UITableView = {
        let table = UITableView()
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        //table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.alwaysBounceVertical = false
        return table
    }()
    
    init(output: SettingViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        [header, settingTableView].forEach{ view.addSubview($0)}
        
        self.view.backgroundColor = StandartColors.settingBackgroundColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            settingTableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            settingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapSettingTableViewCell() {
        output.didTapSettingTableViewCell()
    }
}

extension SettingViewController: SettingViewInput {
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath) as? SettingTableViewCell else { return .init() }
        
        switch settingArray[indexPath.row] {
        case 1:
            cell.selectCell(cell: .toggle)
        case 2:
            cell.selectCell(cell: .screen)
        case 3:
            cell.selectCell(cell: .button)
        default:
            cell.selectCell(cell: .none)
        }
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch settingArray[indexPath.row] {
        case 1: return 120
        case 2: return 76
        case 3: return 84
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(indexPath.row)
        tapSettingTableViewCell()
    }
}
