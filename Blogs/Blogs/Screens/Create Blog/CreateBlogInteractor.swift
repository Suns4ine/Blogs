//
//  CreateBlogInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class CreateBlogInteractor {
	weak var output: CreateBlogInteractorOutput?
    
    private var utilitiesArray: [Utility] = [.image, .alignJustify, .alignLeft, .alignRight, .bold, .italic, .underline]
}

extension CreateBlogInteractor: CreateBlogInteractorInput {
    func getUtility(at indexPath: IndexPath) {
        output?.utilityDidRecieve(utilitiesArray[indexPath.row])
    }
    
    func fetchUtilies() {
        output?.utiliesDidRecieve(utilitiesArray)
    }
    
}
