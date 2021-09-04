//
//  CreateBlogPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class CreateBlogPresenter {
	weak var view: CreateBlogViewInput?
    weak var moduleOutput: CreateBlogModuleOutput?

	private let router: CreateBlogRouterInput
	private let interactor: CreateBlogInteractorInput

    init(router: CreateBlogRouterInput, interactor: CreateBlogInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension CreateBlogPresenter: CreateBlogModuleInput {
    func givedraft(draft: Post) {
        interactor.getDraft(draft: draft)
    }
}

extension CreateBlogPresenter: CreateBlogViewOutput {
    func setupText() {
        interactor.giveText()
    }
    
    func giveText(text: String) {
        interactor.getText(text: text)
    }
    
    func fetchUtiliesCell() {
        interactor.fetchUtilies()
    }
    
    func didTapBackButton() {
        router.popViewController()
    }
    
    func didTapNextButton() {
        interactor.verificationOfEnteredData()
    }
    
    func didTapDraftButton() {
        interactor.printTitle()
        //router.openDraftBlogsViewController()
    }
    
    func didTapUtilitiesCollectionViewCell(at indexPath: IndexPath) {
        interactor.getUtility(at: indexPath)
    }
    
}

extension CreateBlogPresenter: CreateBlogInteractorOutput {
    func transferText(text: String) {
        view?.showText(text: text)
    }
    
    func openAdditionblog(_ draft: Post) {
        router.openAdditionBlogViewController()
    }
    
    func utiliesDidRecieve(_ utilies: [Utility]) {
        let section = UtiliesSectionViewModel()
        utilies.forEach{ section.rows.append(UtiliesCellViewModel.init(utility: $0))}
        view?.reloadData(for: section)
    }
    
    func utilityDidRecieve(_ utility: Utility) {
        debugPrint(utility)
    }
    
}
