//
//  PageViewController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//

import Foundation
import UIKit

final class PageViewController: UIViewController {
    
    //MARK: Create Variable
    private (set) var number = 0
    private var flowHeightConstraint: NSLayoutConstraint?
    private var flowWigthConstraint: NSLayoutConstraint?
    private var centerXConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.layer.zPosition = 2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titlePage: Title = {
        let title = Title(text: StandartLanguage.titlePageScreen,
                          size: Bool.isSmallScreen ? .meb24 : .meb36)
        title.sizeToFit()
        return title
    }()
    
    private lazy var subtitle: SubTitle = {
        let subtitle = SubTitle(text: StandartLanguage.subtitlePageScreen,
                                size: Bool.isSmallScreen ? .mm15 : .mm21)
        subtitle.sizeToFit()
        return subtitle
    }()
    
    //MARK: System override Functions
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
            titlePage.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.titlePageTopIdentConstant),
            titlePage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            titlePage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            titlePage.heightAnchor.constraint(equalToConstant: CGFloat.titlePageHeightIdentConstant),
            
            subtitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: CGFloat.standartIdentConstant/2),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.standartIdentConstant),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.standartIdentConstant),
            subtitle.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -(CGFloat.standartIdentConstant + 13))
        ])
    }
    
    //MARK: Personal Functions
    private func addView() {
        [image, titlePage, subtitle].forEach{ view.addSubview($0)}
    }
    
    private func addConstraintImage() {
        centerXConstraint = image.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        centerXConstraint?.isActive = true
        flowHeightConstraint = image.heightAnchor.constraint(equalToConstant: CGFloat.heightScreen/3.1)
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
                            self.titlePage.editColor(color: .secondWhite)
                            self.subtitle.editColor(color: .secondWhite)
                                        })
        case 1:
            image.image = UIImage(named: "peep-sitting-19")
            flowHeightConstraint?.constant = CGFloat.heightScreen/2.483
            flowWigthConstraint?.constant =  (flowHeightConstraint?.constant ?? 218)/1.5
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
            image.image = UIImage(named: "peep-106")
            flowHeightConstraint?.constant = CGFloat.heightScreen/2.76
            flowWigthConstraint?.constant = (flowHeightConstraint?.constant ?? 255)/1.153
            centerXConstraint?.constant = 10
            bottomConstraint?.constant = -10
            
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
