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

    //MARK: Create Variable
    private var section: SettingSectionRowPresentable = SettingSectionViewModel()
    
    private let header: Header = {
        let header = Header(title: StandartLanguage.headerTitleSettingScreen,
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
        table.translatesAutoresizingMaskIntoConstraints = false
        table.alwaysBounceVertical = false
        return table
    }()
    
    //MARK: System override Functions
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
        
        output.fetchSettingsCell()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(SettingTableViewCell.self,
                                  forCellReuseIdentifier: SettingTableViewCell.identifier)
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
            settingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: Personal Functions
    @objc
    private func tapBackButton() {
        output.didTapBackButton()
    }
    
    @objc
    private func tapSettingButton( _ button: SecondBigButton) {
        guard let index = (button.superview as? SecondBigButton)?.indexPath else { return }

        output.didTapSettingButtonTableViewCell(at: index)
    }
    
    @objc
    private func tapToggleButton( _ button: ToggleButton) {
        //Передаем indexPath  и статус тогеля
        guard let buttonToggle = (button.superview as? ToggleButton) else { return }
        guard let index = buttonToggle.indexPath else { return }
        
        output.didTapToggleButtonTableViewCell((index, buttonToggle.flag))
    }
}

extension SettingViewController: SettingViewInput {
    func updateSettingCell(cartage: (IndexPath, SettingCellIdentifiable)) {
        let index = cartage.0
        let viewModel = cartage.1
        
        section.rows[index.row] = viewModel
    }
    
    func reloadData(for section: SettingSectionViewModel) {
        self.section = section
        settingTableView.reloadData()
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        guard  let cell = tableView.dequeueReusableCell(
                withIdentifier: viewModel.cellIdentifier,
                for: indexPath) as? SettingTableViewCell else { return .init() }
        
        cell.viewModel = viewModel
        
        cell.addIndexPath(indexPath)
        cell.addTargeToggleButton(self, action: #selector(tapToggleButton(_:)))
        cell.addTargeSettingButton(self, action: #selector(tapSettingButton(_:)))
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(section.rows[indexPath.row].cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = section.rows[indexPath.row] as? SettingCellViewModel else { return }
        
        if viewModel.condition == .screen {
            output.didTapSettingTableViewCell(at: indexPath)
        }
    }
}
