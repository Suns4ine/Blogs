//
//  SavedContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import UIKit

final class SavedContainer {
    let input: SavedModuleInput
	let viewController: UIViewController
	private(set) weak var router: SavedRouterInput!

	class func assemble(with context: SavedContext) -> SavedContainer {
        let router = SavedRouter()
        let interactor = SavedInteractor()
        let presenter = SavedPresenter(router: router, interactor: interactor)
		let viewController = SavedViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return SavedContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: SavedModuleInput, router: SavedRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct SavedContext {
	weak var moduleOutput: SavedModuleOutput?
}
