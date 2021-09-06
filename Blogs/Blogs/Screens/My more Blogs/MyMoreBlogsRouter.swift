//
//  MyMoreBlogsRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import UIKit

final class MyMoreBlogsRouter {
    weak var sourceViewController: UIViewController?
}

extension MyMoreBlogsRouter: MyMoreBlogsRouterInput {
    func openBlogViewController(with blog: Blog) {
        let container = BlogContainer.assemble(with: .init())
        container.input.setupBlog(blog: blog)
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
