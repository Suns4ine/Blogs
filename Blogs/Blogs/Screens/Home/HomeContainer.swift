//
//  HomeContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import UIKit

final class HomeContainer {
    let input: HomeModuleInput
	let viewController: UIViewController
	private(set) weak var router: HomeRouterInput!

	class func assemble(with context: HomeContext) -> HomeContainer {
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(router: router, interactor: interactor)
		let viewController = HomeViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return HomeContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: HomeModuleInput, router: HomeRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct HomeContext {
	weak var moduleOutput: HomeModuleOutput?
}
