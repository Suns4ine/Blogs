//
//  ChoiceLanguageContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class ChoiceLanguageContainer {
    let input: ChoiceLanguageModuleInput
	let viewController: UIViewController
	private(set) weak var router: ChoiceLanguageRouterInput!

	class func assemble(with context: ChoiceLanguageContext) -> ChoiceLanguageContainer {
        let router = ChoiceLanguageRouter()
        let interactor = ChoiceLanguageInteractor()
        let presenter = ChoiceLanguagePresenter(router: router, interactor: interactor)
		let viewController = ChoiceLanguageViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return ChoiceLanguageContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ChoiceLanguageModuleInput, router: ChoiceLanguageRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ChoiceLanguageContext {
	weak var moduleOutput: ChoiceLanguageModuleOutput?
}
