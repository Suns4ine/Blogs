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
        let container = MyBlogContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
