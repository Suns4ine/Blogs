//
//  AnotherProfileRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class AnotherProfileRouter {
    weak var sourceViewController: UIViewController?
}

extension AnotherProfileRouter: AnotherProfileRouterInput {
    func openBlogViewController(with blog: Blog) {
        let container = BlogContainer.assemble(with: .init())
        container.input.setupBlog(blog: blog)
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
    
    func openAnotherMoreBlogsViewController(blogs: [Blog]) {
        let container = AnotherMoreBlogsContainer.assemble(with: .init())
        container.input.getArrayBlogs(array: blogs)
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
}
