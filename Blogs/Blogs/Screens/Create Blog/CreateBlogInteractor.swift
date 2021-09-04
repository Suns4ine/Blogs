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
    
    private var nextCreateModule: AdditionBlogModuleInput?
    
    private var utilitiesArray: [Utility] = [.image, .alignJustify, .alignLeft, .alignRight, .bold, .italic, .underline]
    
    private func clearText(_ text: String) -> String {
        let result = text.condenseWhitespace()
        
        return result
    }
    
}

extension CreateBlogInteractor: CreateBlogInteractorInput {
    func giveText() {
        output?.transferText(text: defaultDraft.text)
    }
    
    
    func printTitle() {
        debugPrint(defaultDraft.title)
        debugPrint(defaultDraft.arrayTags)
    }
    
    func getDraft(draft: Post) {
       // self.draft = draft
    }
    
    func verificationOfEnteredData() {
        if !defaultDraft.text.isEmpty {
            output?.openAdditionblog(defaultDraft)
        }
    }
    
    func getText(text: String) {
        defaultDraft.text = clearText(text)
        
        debugPrint("!\(defaultDraft.text)!")
    }
    
    func getUtility(at indexPath: IndexPath) {
        output?.utilityDidRecieve(utilitiesArray[indexPath.row])
    }
    
    func fetchUtilies() {
        output?.utiliesDidRecieve(utilitiesArray)
    }
    
}

extension String {
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
