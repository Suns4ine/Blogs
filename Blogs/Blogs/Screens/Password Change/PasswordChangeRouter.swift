//
//  PasswordChangeRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class PasswordChangeRouter {
    weak var sourceViewController: UIViewController?
}

extension PasswordChangeRouter: PasswordChangeRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
