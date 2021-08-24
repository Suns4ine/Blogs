//
//  SettingRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import UIKit

final class SettingRouter {
    weak var sourceViewController: UIViewController?
}

extension SettingRouter: SettingRouterInput {
    func popViewController() {
        self.sourceViewController?.navigationController?.popViewController(animated: true)
    }
}
