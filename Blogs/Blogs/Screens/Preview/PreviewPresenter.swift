//
//  PreviewPresenter.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import Foundation
import UIKit

final class PreviewPresenter {
	weak var view: PreviewViewInput?
    weak var moduleOutput: PreviewModuleOutput?

	private let router: PreviewRouterInput
	private let interactor: PreviewInteractorInput

    init(router: PreviewRouterInput, interactor: PreviewInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension PreviewPresenter: PreviewModuleInput {
}

extension PreviewPresenter: PreviewViewOutput {
    func newPage(numb: Int) {
        interactor.fetchPage(numb: numb)
    }
    
    func fetchViewPages() {
        interactor.fetchPages()
    }
    
    func didTapLeadingButton() {
        interactor.finishPreview()
    }
    
    func didTapStartButton() {
        interactor.finishPreview()
    }
    
}

extension PreviewPresenter: PreviewInteractorOutput {
    func openStartViewController() {
        router.openStartViewController()
    }
    
    func finalChanges() {
        view?.setupFinalChanges()
    }
    
    func pagesDidRecieve(_ pages: [Page]) {
        let section = PageSectionViewModel()
        pages.forEach{ section.rows.append(PageViewModel.init(page: $0))}
        view?.reloadData(for: section)
    }
    
}
