//
//  TabBarController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    class HomeOutPut: HomeViewOutput { }
    private lazy var homeController: HomeViewController = {
        let controller = HomeViewController(output: HomeOutPut.init())
        controller.title = "Home"
        controller.tabBarItem.image = UIImage(named: Icons.home1.rawValue)
        return controller
    }()
    
    private let searchController: SomeViewController = {
        let controller = SomeViewController()
        controller.title = "Search"
        controller.tabBarItem.image = UIImage(named: Icons.search.rawValue)
    return controller
    }()
    
    private let savedController: SomeViewController = {
        let controller = SomeViewController()
        controller.title = "Saved"
        controller.tabBarItem.image = UIImage(named: Icons.star.rawValue)
        return controller
    }()
    
    private let  profileController: SomeViewController = {
        let controller = SomeViewController()
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
