//
//  DraftBlogsRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class DraftBlogsRouter {
    weak var sourceViewController: UIViewController?
}

extension DraftBlogsRouter: DraftBlogsRouterInput {
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
    
    func openBlogViewController(with blog: Blog) {
        let container = AnotherBlogContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
