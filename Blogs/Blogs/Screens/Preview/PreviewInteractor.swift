//
//  PreviewInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 16.08.2021.
//  
//

import Foundation

final class PreviewInteractor {
	weak var output: PreviewInteractorOutput?
    
    private var arrayPageModels: [Page] = [.init(numb: 0, title: "Заголовок 1", subtitle: "Текст 1"),
                                                .init(numb: 1, title: "Заголовок 2", subtitle: "Текст 2"),
                                                .init(numb: 2, title: "Заголовок 3", subtitle: "Текст 3")]
    private var finised = false
}

extension PreviewInteractor: PreviewInteractorInput {
    func fetchPage(numb: Int) {
        if numb == arrayPageModels.count - 1 && finised == false {
            finised = true
            output?.finalChanges()
        }
    }
    
    func fetchPages() {
        output?.pagesDidRecieve(arrayPageModels)
    }
    
}
