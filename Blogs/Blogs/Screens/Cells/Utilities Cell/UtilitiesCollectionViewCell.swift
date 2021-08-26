//
//  UtilitiesCollectionViewCell.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//

import Foundation
import UIKit

final class UtilitiesCollectionViewCell: UICollectionViewCell, UtiliesCellModelRepresentable {
    
    var viewModel: UtiliesCellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let viewModel = viewModel as? UtiliesCellViewModel else { return }
        UtilitiesCollectionViewCell.identifier = viewModel.cellIdentifier
        icon.editIcon(icon: returnUtilityIcon(utility: viewModel.utility))
    }
    
    static var identifier = "UtilitiesCollectionViewCell"
    
    private let backgroundViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let icon: IconImage = {
        let icon = IconImage(icon: .image, size: .size24)
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [icon, backgroundViewCell].forEach{ addSubview($0) }
        
        self.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            icon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            icon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event = .touchUpInside) {
        icon.addTarget(target, action: action, for: event)
    }
    
    func addTag(_ tag: Int) {
        icon.addTag(tag)
    }
}
