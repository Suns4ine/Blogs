//
//  ChoiceTableViewCell.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//

import Foundation
import UIKit

final class ChoiceTableViewCell: UITableViewCell, ChoiceCellModelRepresentable {
    
    //MARK: Create Variable
    var viewModel: ChoiceCellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    static var identifier = "ChoiceTableViewCell"
    private let button: FirstBigButton = {
        let button = FirstBigButton(text: StandartLanguage.titleChoiceCell)
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
    
    private func setup() {
        [button].forEach{ contentView.addSubview($0)}
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
    }
    
    //MARK: Personal Functions
    private func updateViews() {
        guard let viewModel = viewModel as? ChoiceCellViewModel else { return }
        button.editText(text: viewModel.title)
        ChoiceTableViewCell.identifier = viewModel.cellIdentifier
    }
}

extension ChoiceTableViewCell {
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(target, action: action, for: event)
    }
    
    func addTag(_ tag: Int) {
        button.addTag(tag)
    }
}
