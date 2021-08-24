//
//  SearchRouter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import UIKit

final class SearchRouter {
    weak var sourceViewController: UIViewController?
}

extension SearchRouter: SearchRouterInput {
    func openSettingViewController() {
        let container = SettingContainer.assemble(with: .init())
        self.sourceViewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}
