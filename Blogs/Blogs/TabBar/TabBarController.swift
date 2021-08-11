//
//  TabBarController.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    private var addVC = false
    
    private lazy var homeController: SomeViewController = {
        let home = SomeViewController()
        home.title = "Home"
        home.tabBarItem.image = UIImage(named: Icons.home1.rawValue)
        return home
    }()
    
    private lazy var  searchController: SomeViewController = {
        let search = SomeViewController()
        search.title = "Search"
        search.tabBarItem.image = UIImage(named: Icons.search.rawValue)
    return search
    }()
    
    private lazy var  savedController: SomeViewController = {
        let saved = SomeViewController()
        saved.title = "Saved"
        saved.tabBarItem.image = UIImage(named: Icons.star.rawValue)
        return saved
    }()
    
    private lazy var  profileController: UIViewController = {
        let profile = UIViewController()
        profile.title = "Profile"
        profile.tabBarItem.image = UIImage(named: Icons.user.rawValue)
        return profile
    }()
    
    private lazy var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = StandartColors.borderColor
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = StandartColors.selectedItemTintColor
        tabBar.unselectedItemTintColor = StandartColors.smallIconColor
        tabBar.barTintColor = StandartColors.tabBarBackgroundColor
        //tabBar.isTranslucent = false
        [borderView].forEach{ tabBar.addSubview($0) }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //tabBar.isTranslucent = false
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setViewControllers()
    }

    private func setViewControllers() {
        if addVC == false {
            self.setViewControllers([homeController, searchController, savedController, profileController], animated: true)
            addVC = true
        }
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
