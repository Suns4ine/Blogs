//
//  BlogRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 05.09.2021.
//  
//

import UIKit

final class BlogRouter {
    weak var sourceViewController: UIViewController?
}

extension BlogRouter: BlogRouterInput {
    
    func openCreateBlogViewController() {
        let container = CreateBlogContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
    
    func openProfileController(with user: User) {
        
        if user == defaultUser {
            let tabBarController = TabBarController()
            tabBarController.selectedIndex = 3
            self.sourceViewController?.navigationController?.pushViewController(tabBarController, animated: true)
        } else {
            let container = AnotherProfileContainer.assemble(with: .init())
            self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
        }
    }

}
