//
//  SettingContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 15.08.2021.
//  
//

import UIKit

final class SettingContainer {
    let input: SettingModuleInput
	let viewController: UIViewController
	private(set) weak var router: SettingRouterInput!

	class func assemble(with context: SettingContext) -> SettingContainer {
        let router = SettingRouter()
        let interactor = SettingInteractor()
        let presenter = SettingPresenter(router: router, interactor: interactor)
		let viewController = SettingViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return SettingContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: SettingModuleInput, router: SettingRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct SettingContext {
	weak var moduleOutput: SettingModuleOutput?
}
