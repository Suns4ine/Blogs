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
}
