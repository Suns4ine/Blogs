//
//  MyProfilePresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import Foundation

final class MyProfilePresenter {
	weak var view: MyProfileViewInput?
    weak var moduleOutput: MyProfileModuleOutput?

	private let router: MyProfileRouterInput
	private let interactor: MyProfileInteractorInput

    init(router: MyProfileRouterInput, interactor: MyProfileInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension MyProfilePresenter: MyProfileModuleInput {
}

extension MyProfilePresenter: MyProfileViewOutput {
}

extension MyProfilePresenter: MyProfileInteractorOutput {
}
