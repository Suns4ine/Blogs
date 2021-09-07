//
//  EditProfileRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class EditProfileRouter {
    weak var sourceViewController: UIViewController?
}

extension EditProfileRouter: EditProfileRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
