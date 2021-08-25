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
    
    func openSettingViewController() {
        let container = SettingContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openBlogViewController(with blog: Blog) {
        let container = AnotherBlogContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openAnotherProfileController(with user: User) {
        let container = AnotherProfileContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
