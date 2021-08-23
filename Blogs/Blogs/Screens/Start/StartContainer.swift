//
//  StartContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 10.08.2021.
//  
//

import UIKit

final class StartContainer {
    let input: StartModuleInput
	let viewController: UIViewController
	private(set) weak var router: StartRouterInput!

	class func assemble(with context: StartContext) -> StartContainer {
        let router = StartRouter()
        let interactor = StartInteractor()
        let presenter = StartPresenter(router: router, interactor: interactor)
		let viewController = StartViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        router.sourceViewCintroller = viewController
        
        return StartContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: StartModuleInput, router: StartRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct StartContext {
	weak var moduleOutput: StartModuleOutput?
}
