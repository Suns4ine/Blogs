//
//  SavedRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import UIKit

final class SavedRouter {
    weak var sourceViewController: UIViewController?
}

extension SavedRouter: SavedRouterInput {
    func openSettingViewController() {
        let container = SettingContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openBlogViewController(with blog: Blog) {
        let container = BlogContainer.assemble(with: .init())
        container.input.setupBlog(blog: blog)
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
