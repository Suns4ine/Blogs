//
//  AnotherProfileContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class AnotherProfileContainer {
    let input: AnotherProfileModuleInput
	let viewController: UIViewController
	private(set) weak var router: AnotherProfileRouterInput!

	class func assemble(with context: AnotherProfileContext) -> AnotherProfileContainer {
        let router = AnotherProfileRouter()
        let interactor = AnotherProfileInteractor()
        let presenter = AnotherProfilePresenter(router: router, interactor: interactor)
		let viewController = AnotherProfileViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return AnotherProfileContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AnotherProfileModuleInput, router: AnotherProfileRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AnotherProfileContext {
	weak var moduleOutput: AnotherProfileModuleOutput?
}
