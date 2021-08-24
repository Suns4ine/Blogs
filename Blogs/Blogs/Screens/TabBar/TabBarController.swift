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
    private lazy var homeController: HomeViewController = {
        let controller = homeContainer.viewController
        controller.title = "Home"
        controller.tabBarItem.image = UIImage(named: Icons.home1.rawValue)
        return controller as! HomeViewController
    }()
    
    private let searchContainer = SearchContainer.assemble(with: .init())
    private lazy var searchController: SearchViewController = {
        let controller = searchContainer.viewController
        controller.title = "Search"
        controller.tabBarItem.image = UIImage(named: Icons.search.rawValue)
    return controller as! SearchViewController
    }()
    
    private let savedhContainer = SavedContainer.assemble(with: .init())
    private lazy var savedController: SavedViewController = {
        let controller = savedhContainer.viewController
        controller.title = "Saved"
        controller.tabBarItem.image = UIImage(named: Icons.star.rawValue)
        return controller as! SavedViewController
    }()
    
    private let myProfileContainer = AnotherMoreBlogsContainer.assemble(with: .init())
    private lazy var profileController: UIViewController = {
        let controller = myProfileContainer.viewController
        controller.title = "Profile"
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
