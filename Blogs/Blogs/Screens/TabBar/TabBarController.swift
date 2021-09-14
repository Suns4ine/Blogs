//
//  TabBarController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    
    private let homeContainer = HomeContainer.assemble(with: .init())
    private lazy var homeController: UIViewController = {
        let controller = homeContainer.viewController
        controller.title = StandartLanguage.homeTabBar
        controller.tabBarItem.image = UIImage(named: Icons.home1.rawValue)
        return controller
    }()
    
    private let searchContainer = SearchContainer.assemble(with: .init())
    private lazy var searchController: UIViewController = {
        let controller = searchContainer.viewController
        controller.title = StandartLanguage.searchTabBar
        controller.tabBarItem.image = UIImage(named: Icons.search.rawValue)
        return controller
    }()
    
    private let savedhContainer = SavedContainer.assemble(with: .init())
    private lazy var savedController: UIViewController = {
        let controller = savedhContainer.viewController
        controller.title = StandartLanguage.savedTabBar
        controller.tabBarItem.image = UIImage(named: Icons.heart.rawValue)
        return controller
    }()
    
    private let myProfileContainer = MyProfileContainer.assemble(with: .init())
    private lazy var profileController: UIViewController = {
        let controller = myProfileContainer.viewController
        controller.title = StandartLanguage.profileTabBar
        controller.tabBarItem.image = UIImage(named: Icons.user.rawValue)
        return controller
    }()
    
    private let borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = StandartColors.borderColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        tabBar.isTranslucent = false
        tabBar.tintColor = StandartColors.selectedItemTintColor
        tabBar.unselectedItemTintColor = StandartColors.smallIconColor
        tabBar.barTintColor = StandartColors.tabBarBackgroundColor
        [borderView].forEach{ tabBar.addSubview($0) }
        
        self.setViewControllers([homeController, searchController, savedController, profileController], animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            borderView.heightAnchor.constraint(equalToConstant: 1),
            borderView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            borderView.topAnchor.constraint(equalTo: tabBar.topAnchor)
        ])
    }
}
