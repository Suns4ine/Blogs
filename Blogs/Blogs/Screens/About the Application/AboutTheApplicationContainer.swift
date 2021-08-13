//
//  AboutTheApplicationContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class AboutTheApplicationContainer {
    let input: AboutTheApplicationModuleInput
	let viewController: UIViewController
	private(set) weak var router: AboutTheApplicationRouterInput!

	class func assemble(with context: AboutTheApplicationContext) -> AboutTheApplicationContainer {
        let router = AboutTheApplicationRouter()
        let interactor = AboutTheApplicationInteractor()
        let presenter = AboutTheApplicationPresenter(router: router, interactor: interactor)
		let viewController = AboutTheApplicationViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return AboutTheApplicationContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: AboutTheApplicationModuleInput, router: AboutTheApplicationRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct AboutTheApplicationContext {
	weak var moduleOutput: AboutTheApplicationModuleOutput?
}
