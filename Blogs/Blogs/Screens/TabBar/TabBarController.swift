//
//  TabBarController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private let homeController: UIViewController = {
        let controller = UIViewController()
        controller.title = "Home"
        controller.tabBarItem.image = UIImage(named: Icons.home1.rawValue)
        controller.view.backgroundColor = StandartColors.tabBarBackgroundColor
        return controller
    }()
    
    private let searchController: UIViewController = {
        let controller = UIViewController()
        controller.title = "Search"
        controller.tabBarItem.image = UIImage(named: Icons.search.rawValue)
        controller.view.backgroundColor = StandartColors.tabBarBackgroundColor
    return controller
    }()
    
    private let savedController: UIViewController = {
        let controller = UIViewController()
        controller.title = "Saved"
        controller.tabBarItem.image = UIImage(named: Icons.star.rawValue)
        controller.view.backgroundColor = StandartColors.tabBarBackgroundColor
        return controller
    }()
    
    private let  profileController: UIViewController = {
        let controller = UIViewController()
        controller.title = "Profile"
        controller.tabBarItem.image = UIImage(named: Icons.user.rawValue)
        controller.view.backgroundColor = StandartColors.tabBarBackgroundColor
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
        
        tabBar.tintColor = StandartColors.selectedItemTintColor
        tabBar.unselectedItemTintColor = StandartColors.smallIconColor
        tabBar.barTintColor = StandartColors.tabBarBackgroundColor
        tabBar.isTranslucent = false
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
