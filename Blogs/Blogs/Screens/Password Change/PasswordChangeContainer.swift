//
//  PasswordChangeContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class PasswordChangeContainer {
    let input: PasswordChangeModuleInput
	let viewController: UIViewController
	private(set) weak var router: PasswordChangeRouterInput!

	class func assemble(with context: PasswordChangeContext) -> PasswordChangeContainer {
        let router = PasswordChangeRouter()
        let interactor = PasswordChangeInteractor()
        let presenter = PasswordChangePresenter(router: router, interactor: interactor)
		let viewController = PasswordChangeViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return PasswordChangeContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: PasswordChangeModuleInput, router: PasswordChangeRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct PasswordChangeContext {
	weak var moduleOutput: PasswordChangeModuleOutput?
}
