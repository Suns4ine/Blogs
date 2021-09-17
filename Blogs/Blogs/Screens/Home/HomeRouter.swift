//
//  HomeRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import UIKit

final class HomeRouter {
    weak var sourceViewController: UIViewController?
}

extension HomeRouter: HomeRouterInput {
    
    func openBlogViewController(with blog: Blog) {
        let container = BlogContainer.assemble(with: .init())
        container.input.setupBlog(blog: blog)
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openSettingViewController() {
        let container = SettingContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openProfileController(with user: User) {
        
        if user == defaultUser {
            let tabBarController = TabBarController()
            tabBarController.selectedIndex = 3
            self.sourceViewController?.navigationController?.pushViewController(tabBarController, animated: false)
        } else {
            let container = AnotherProfileContainer.assemble(with: .init())
            container.input.openUser(user: user)
            self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
        }
    }
}
