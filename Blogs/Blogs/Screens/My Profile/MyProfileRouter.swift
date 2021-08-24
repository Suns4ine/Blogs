//
//  MyProfileRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import UIKit

final class MyProfileRouter {
    weak var sourceViewController: UIViewController?
}

extension MyProfileRouter: MyProfileRouterInput {
    func openSettingViewController() {
        let container = SettingContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openEditProfileViewController() {
        let container = EditProfileContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openCreateBlogViewController() {
        let container = CreateBlogContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
    
    func openMyMoreBlogsViewController() {
//        let container = SettingContainer.assemble(with: .init())
//        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
