//
//  PageViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//

import Foundation
import UIKit

final class PageViewController: UIViewController {
    
    //MARK: Public Property
    
    var viewModel: PageIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: Private Property
    
    private (set) var number = 0
    private var flowHeightConstraint: NSLayoutConstraint?
    private var centerXConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.layer.zPosition = 2
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var titlePage: Title = {
        let title = Title(text: StandartLanguage.titlePageScreen,
                          size: .meb36)
        return title
    }()
    
    private lazy var subtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.subtitlePageScreen,
                                size: .mm21)
        return subtitle
    }()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviewsInView()
        addLayoutSubviews()
        updatePage()
    }
    
    //MARK: Private Methods
    
    private func updateViews() {
        guard let viewModel = viewModel as? PageViewModel else { return }
        
        number = viewModel.numb
        titlePage.editText(text: viewModel.title)
        subtitle.editText(text: viewModel.subtitle)
    }
    
    private func addSubviewsInView() {
        [image, titlePage, subtitle].forEach{ view.addSubview($0)}
    }
    
    private func addLayoutSubviews() {
        NSLayoutConstraint.activate([
            titlePage.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: CGFloat.titlePageTopIdentConstant),
            titlePage.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: CGFloat.standartIdentConstant),
            titlePage.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -CGFloat.standartIdentConstant),
            titlePage.heightAnchor.constraint(equalToConstant: CGFloat.titlePageHeightIdentConstant),
            
            subtitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor,
                                          constant: CGFloat.standartIdentConstant/2),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                              constant: CGFloat.standartIdentConstant),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                               constant: -CGFloat.standartIdentConstant),
            subtitle.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor,
                                             constant: -(CGFloat.standartIdentConstant + 13))
        ])
        
        centerXConstraint = image.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        centerXConstraint?.isActive = true
        flowHeightConstraint = image.heightAnchor.constraint(equalToConstant: CGFloat.heightScreen/3.1)
        flowHeightConstraint?.isActive = true
        bottomConstraint = image.bottomAnchor.constraint(equalTo: titlePage.topAnchor, constant: -10)
        bottomConstraint?.isActive = true
    }
    
    private func updatePage() {
        switch number {
        case 0:
            image.image = UIImage(named: ImageAssets.peep107.rawValue)
           
            UIView.animate(withDuration: 0.1,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.titlePage.editColor(color: .secondWhite)
                            self.subtitle.editColor(color: .secondWhite)
                                        })
        case 1:
            image.image = UIImage(named: ImageAssets.peepSitting19.rawValue)
            flowHeightConstraint?.constant = CGFloat.heightScreen/2.483
            centerXConstraint?.constant = 20
            bottomConstraint?.constant = 0
           
            UIView.animate(withDuration: 0.1,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.titlePage.editColor(color: .firstBlack)
                            self.subtitle.editColor(color: .secondBlack)
                                        })
        case 2:
            image.image = UIImage(named: ImageAssets.peep108.rawValue)
            flowHeightConstraint?.constant = CGFloat.heightScreen/2.76
            centerXConstraint?.constant = 10
            bottomConstraint?.constant = 0
            
            UIView.animate(withDuration: 0.1,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.titlePage.editColor(color: .firstBlack)
                            self.subtitle.editColor(color: .secondBlack)
                                        })
        default: break
        }
    }
}
