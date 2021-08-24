//
//  CreateBlogRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import UIKit

final class CreateBlogRouter {
    weak var sourceViewController: UIViewController?
}

extension CreateBlogRouter: CreateBlogRouterInput {
    
    func openDraftBlogsViewController() {
        let container = DraftBlogsContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openAdditionBlogViewController() {
        let container = AdditionBlogContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
