//
//  SettingTableViewCell.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//

import Foundation
import UIKit

enum SelectSettingCell: CaseIterable {
    case toggle
    case screen
    case button
    case none
}

final class SettingTableViewCell: UITableViewCell, SettingCellModelRepresentable {
    
    //MARK: Create Variable
    private (set) var flag = false
    var viewModel: SettingCellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    static var identifier = "SettingTableViewCell"
    private var typeCell: SelectSettingCell = .none {
        didSet {
            selectCell(cell: typeCell)
        }
    }
    
    private let backgroundSettingView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.settingCellBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let title: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.titleSettingCell, size: .meb21)
        subtitle.editAligent(aligent: .natural)
        subtitle.sizeToFit()
        return subtitle
    }()
    
    private let subtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.subtitleSettingCell, size: .mm15)
        subtitle.editAligent(aligent: .natural)
        subtitle.sizeToFit()
        return subtitle
    }()
    
    private let icon: IconImage = {
        let icon = IconImage(icon: .chervonRight, size: .size24)
        return icon
    }()
    
    private let button: SecondBigButton = {
        let button = SecondBigButton(text: StandartLanguage.buttonSettingCell, icon: .none)
        return button
    }()
    
    private let togleButton: ToggleButton = {
        let button = ToggleButton()
        return button
    }()
    
    //MARK: System override Functions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            backgroundSettingView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundSettingView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundSettingView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundSettingView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    //MARK: Personal Functions
    private func setup() {
        [backgroundSettingView, title, subtitle,
         button, icon, togleButton].forEach{ contentView.addSubview($0)}
        selectCell(cell: typeCell)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    func selectCell(cell: SelectSettingCell) {
        [title, subtitle, button, icon, togleButton].forEach{ $0.isHidden = true }
        
        switch cell {
        case .button:
            button.isHidden = false
        case .screen:
            title.isHidden = false
            icon.isHidden = false
        case .toggle:
            title.isHidden = false
            subtitle.isHidden = false
            togleButton.isHidden = false
        default:
            break
        }
        layoutCell()
    }
    
    private func layoutCell() {
        switch typeCell {
        case .button:
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: backgroundSettingView.topAnchor, constant: CGFloat.standartIdentConstant/2),
                button.leadingAnchor.constraint(equalTo: backgroundSettingView.leadingAnchor,
                                                constant: CGFloat.standartIdentConstant),
                button.trailingAnchor.constraint(equalTo: backgroundSettingView.trailingAnchor,
                                                 constant: -CGFloat.standartIdentConstant),
                button.bottomAnchor.constraint(equalTo: backgroundSettingView.bottomAnchor,
                                               constant: -CGFloat.standartIdentConstant/2)
            ])
        case .screen:
            NSLayoutConstraint.activate([
                icon.centerYAnchor.constraint(equalTo: backgroundSettingView.centerYAnchor),
                icon.trailingAnchor.constraint(equalTo:  backgroundSettingView.trailingAnchor,
                                               constant: -CGFloat.standartIdentConstant),
                
                title.topAnchor.constraint(equalTo: backgroundSettingView.topAnchor, constant: CGFloat.standartIdentConstant),
                title.leadingAnchor.constraint(equalTo: backgroundSettingView.leadingAnchor,
                                               constant: CGFloat.standartIdentConstant),
                title.trailingAnchor.constraint(lessThanOrEqualTo: icon.leadingAnchor,
                                                constant: -(CGFloat.minimumIdentConstant + 2)),
                title.bottomAnchor.constraint(equalTo: backgroundSettingView.bottomAnchor, constant: -CGFloat.standartIdentConstant)
            ])
        case .toggle:
            NSLayoutConstraint.activate([
                togleButton.topAnchor.constraint(equalTo: backgroundSettingView.topAnchor, constant: CGFloat.standartIdentConstant),
                togleButton.trailingAnchor.constraint(equalTo: backgroundSettingView.trailingAnchor,
                                                      constant: -CGFloat.standartIdentConstant),
                
                title.topAnchor.constraint(equalTo: backgroundSettingView.topAnchor, constant: CGFloat.standartIdentConstant),
                title.leadingAnchor.constraint(equalTo: backgroundSettingView.leadingAnchor,
                                               constant: CGFloat.standartIdentConstant),
                title.trailingAnchor.constraint(lessThanOrEqualTo: togleButton.leadingAnchor,
                                                constant: -(CGFloat.standartIdentConstant - 10)),
                title.heightAnchor.constraint(equalToConstant: CGFloat.subTitleHeight28Constant),
                
                subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: CGFloat.minimumIdentConstant - 1),
                subtitle.leadingAnchor.constraint(equalTo: backgroundSettingView.leadingAnchor,
                                                  constant: CGFloat.standartIdentConstant),
                subtitle.trailingAnchor.constraint(lessThanOrEqualTo: togleButton.leadingAnchor,
                                                   constant: -(CGFloat.standartIdentConstant - 10)),
                subtitle.bottomAnchor.constraint(lessThanOrEqualTo: backgroundSettingView.bottomAnchor,
                                                 constant: -(CGFloat.minimumIdentConstant - 1))
            ])
        default: break
        }
    }
    
    private func updateViews() {
        guard let viewModel = viewModel as? SettingCellViewModel else { return }
        title.editText(text: viewModel.title)
        subtitle.editText(text: viewModel.subtitle)
        icon.editIcon(icon: viewModel.icon)
        button.editText(text: viewModel.title)
        typeCell = viewModel.condition
        SettingTableViewCell.identifier = viewModel.cellIdentifier
        flag = viewModel.flag
        togleButton.isOn(bool: !flag)
    }
}

extension SettingTableViewCell {
    func addTargeSettingButton(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(target, action: action, for: event)
    }
    
    func addTargeToggleButton(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        togleButton.addTarget(target, action: action, for: event)
    }
    
    func addIndexPath(_ indexPath: IndexPath) {
        
        button.addIndexPath(index: indexPath)
        togleButton.addIndexPath(index: indexPath)
    }
    
    func addTag(_ tag: Int) {
        button.addTag(tag)
        togleButton.addTag(tag)
    }
}
