//
//  MyProfileContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import UIKit

final class MyProfileContainer {
    let input: MyProfileModuleInput
	let viewController: UIViewController
	private(set) weak var router: MyProfileRouterInput!

	class func assemble(with context: MyProfileContext) -> MyProfileContainer {
        let router = MyProfileRouter()
        let interactor = MyProfileInteractor()
        let presenter = MyProfilePresenter(router: router, interactor: interactor)
		let viewController = MyProfileViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return MyProfileContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: MyProfileModuleInput, router: MyProfileRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct MyProfileContext {
	weak var moduleOutput: MyProfileModuleOutput?
}
