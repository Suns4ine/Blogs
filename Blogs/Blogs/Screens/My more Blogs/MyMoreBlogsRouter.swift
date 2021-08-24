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
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
