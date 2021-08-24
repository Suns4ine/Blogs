//
//  ChoiceColorContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class ChoiceColorContainer {
    let input: ChoiceColorModuleInput
	let viewController: UIViewController
	private(set) weak var router: ChoiceColorRouterInput!

	class func assemble(with context: ChoiceColorContext) -> ChoiceColorContainer {
        let router = ChoiceColorRouter()
        let interactor = ChoiceColorInteractor()
        let presenter = ChoiceColorPresenter(router: router, interactor: interactor)
		let viewController = ChoiceColorViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return ChoiceColorContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ChoiceColorModuleInput, router: ChoiceColorRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ChoiceColorContext {
	weak var moduleOutput: ChoiceColorModuleOutput?
}
