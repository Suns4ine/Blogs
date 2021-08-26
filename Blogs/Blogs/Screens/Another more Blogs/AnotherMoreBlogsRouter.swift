//
//  AnotherMoreBlogsRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import UIKit

final class AnotherMoreBlogsRouter {
    weak var sourceViewController: UIViewController?
}

extension AnotherMoreBlogsRouter: AnotherMoreBlogsRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
    
    func openBlogViewController(with blog: Blog) {
        let container = AnotherBlogContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
