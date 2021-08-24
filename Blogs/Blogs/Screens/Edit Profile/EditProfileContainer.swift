//
//  EditProfileContainer.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import UIKit

final class EditProfileContainer {
    let input: EditProfileModuleInput
	let viewController: UIViewController
	private(set) weak var router: EditProfileRouterInput!

	class func assemble(with context: EditProfileContext) -> EditProfileContainer {
        let router = EditProfileRouter()
        let interactor = EditProfileInteractor()
        let presenter = EditProfilePresenter(router: router, interactor: interactor)
		let viewController = EditProfileViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter
        
        router.sourceViewController = viewController

        return EditProfileContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: EditProfileModuleInput, router: EditProfileRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct EditProfileContext {
	weak var moduleOutput: EditProfileModuleOutput?
}
