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

final class SettingTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"
    private var typeCell: SelectSettingCell = .none
    
    private let backgroundSettingView: UIView = {
        let view = UIView()
        view.backgroundColor = StandartColors.settingCellBackgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let title: SubTitle = {
        let subtitle = SubTitle(text: "Уведомления", size: .meb21)
        subtitle.editAligent(aligent: .natural)
        subtitle.sizeToFit()
        return subtitle
    }()
    
    private let subtitle: SubTitle = {
        let subtitle = SubTitle(text: "subtitle Если не хотите получать уведомления, то просто отключите здесь", size: .mm15)
        subtitle.editAligent(aligent: .natural)
        subtitle.sizeToFit()
        return subtitle
    }()
    
    private let icon: IconImage = {
        let icon = IconImage(icon: .chervonRight, size: .size24)
        return icon
    }()
    
    private let button: SecondBigButton = {
        let button = SecondBigButton(text: "button", icon: .none)
        return button
    }()
    
    private let togleButton: ToggleButton = {
        let button = ToggleButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func selectCell(cell: SelectSettingCell) {
        typeCell = cell
        
        [title, subtitle, button, icon, togleButton].forEach{ $0.isHidden = true}
        
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
                button.topAnchor.constraint(equalTo: backgroundSettingView.topAnchor, constant: 12),
                button.leadingAnchor.constraint(equalTo: backgroundSettingView.leadingAnchor, constant: 24),
                button.trailingAnchor.constraint(equalTo: backgroundSettingView.trailingAnchor, constant: -24),
                button.bottomAnchor.constraint(equalTo: backgroundSettingView.bottomAnchor, constant: -12)
            ])
        case .screen:
            NSLayoutConstraint.activate([
                icon.centerYAnchor.constraint(equalTo: backgroundSettingView.centerYAnchor),
                icon.trailingAnchor.constraint(equalTo:  backgroundSettingView.trailingAnchor, constant: -24),
                
                title.topAnchor.constraint(equalTo: backgroundSettingView.topAnchor, constant: 24),
                title.leadingAnchor.constraint(equalTo: backgroundSettingView.leadingAnchor, constant: 24),
                title.trailingAnchor.constraint(lessThanOrEqualTo: icon.leadingAnchor, constant: -7),
                title.bottomAnchor.constraint(equalTo: backgroundSettingView.bottomAnchor, constant: -24)
            ])
        case .toggle:
            NSLayoutConstraint.activate([
                
                togleButton.topAnchor.constraint(equalTo: backgroundSettingView.topAnchor, constant: 24),
                togleButton.trailingAnchor.constraint(equalTo: backgroundSettingView.trailingAnchor, constant: -24),
                
                title.topAnchor.constraint(equalTo: backgroundSettingView.topAnchor, constant: 24),
                title.leadingAnchor.constraint(equalTo: backgroundSettingView.leadingAnchor, constant: 24),
                title.trailingAnchor.constraint(lessThanOrEqualTo: togleButton.leadingAnchor, constant: -14),
                title.heightAnchor.constraint(equalToConstant: 28),
                
                subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
                subtitle.leadingAnchor.constraint(equalTo: backgroundSettingView.leadingAnchor, constant: 24),
                subtitle.trailingAnchor.constraint(lessThanOrEqualTo: togleButton.leadingAnchor, constant: -14),
                subtitle.bottomAnchor.constraint(lessThanOrEqualTo: backgroundSettingView.bottomAnchor, constant: -4)
            ])
        default:
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [backgroundSettingView, title, subtitle, button, icon, togleButton].forEach{ self.contentView.addSubview($0)}
        selectCell(cell: typeCell)
        
        self.backgroundColor = .clear
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
}
