//
//  PageViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//

import Foundation
import UIKit

final class PageViewController: UIViewController {
    
    private let heightScreen = UIScreen.main.bounds.height
    private (set) var number = 0
    private var flowHeightConstraint: NSLayoutConstraint?
    private var flowWigthConstraint: NSLayoutConstraint?
    private var centerXConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    private var isSmallScreen =  UIScreen.main.bounds.height <= 667
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.layer.zPosition = 2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titlePage: Title = {
        let title = Title(text: StandartLanguage.titlePageScreen,
                          size: isSmallScreen ? .meb24 : .meb36)
        title.sizeToFit()
        return title
    }()
    
    private lazy var subtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.subtitlePageScreen,
                                size: isSmallScreen ? .mm15 : .mm21)
        subtitle.sizeToFit()
        return subtitle
    }()
    
    convenience init(pageModel: PageIdentifiable) {
        self.init()
        
        guard let pageModel = pageModel as? PageViewModel else { return }
        
        number = pageModel.numb
        titlePage.editText(text: pageModel.title)
        subtitle.editText(text: pageModel.subtitle)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        addConstraintImage()
        setup()
        self.view.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            
            titlePage.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: isSmallScreen ? heightScreen/1.77 : heightScreen/1.93),
            titlePage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titlePage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titlePage.heightAnchor.constraint(equalToConstant: isSmallScreen ? 60 : 88),
            
            subtitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 12),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            subtitle.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -37)
        ])
        
    }
    
    private func addView() {
        [image, titlePage, subtitle].forEach{ view.addSubview($0)}
    }
    
    private func addConstraintImage() {
        centerXConstraint = image.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        centerXConstraint?.isActive = true
        flowHeightConstraint = image.heightAnchor.constraint(equalToConstant: heightScreen/3.1)
        flowHeightConstraint?.isActive = true
        flowWigthConstraint = image.widthAnchor.constraint(equalToConstant: (flowHeightConstraint?.constant ?? 240)/1.083)
        flowWigthConstraint?.isActive = true
        bottomConstraint = image.bottomAnchor.constraint(equalTo: titlePage.topAnchor, constant: -10)
        bottomConstraint?.isActive = true
    }
    
    private func setup() {
        
        switch number {
        case 0:
            image.image = UIImage(named: "peep-107")
           
            UIView.animate(withDuration: 0.1,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.titlePage.editColor(color: StandartColors.anotherTitleColor)
                            self.subtitle.editColor(color: StandartColors.anotherTextColor)
                                        },
                           completion: nil)
        case 1:
            image.image = UIImage(named: "peep-sitting-19")
            flowHeightConstraint?.constant = heightScreen/2.483
            flowWigthConstraint?.constant =  (flowHeightConstraint?.constant ?? 218)/1.5
            centerXConstraint?.constant = 20
            bottomConstraint?.constant = 0
           
            UIView.animate(withDuration: 0.1,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.titlePage.editColor(color: StandartColors.titleColor)
                            self.subtitle.editColor(color: StandartColors.textColor)
                                        },
                           completion: nil)
            

        case 2:
            image.image = UIImage(named: "peep-106")
            flowHeightConstraint?.constant = heightScreen/2.76
            flowWigthConstraint?.constant = (flowHeightConstraint?.constant ?? 255)/1.153
            centerXConstraint?.constant = 10
            bottomConstraint?.constant = -10
            
            UIView.animate(withDuration: 0.1,
                           delay: 0.1,
                           options: .allowAnimatedContent,
                           animations: {
                            self.titlePage.editColor(color: StandartColors.titleColor)
                            self.subtitle.editColor(color: StandartColors.textColor)
                                        },
                           completion: nil)
        default:
            break
        }
    }
}
