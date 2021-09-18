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
    
    private let updateQueue = DispatchQueue(label: "updateQueueCreateBlog",
                                            qos: .utility,
                                            attributes: .concurrent,
                                            autoreleaseFrequency: .workItem)
    
    private func clearText(_ text: String) -> String {
        let result = text.condenseWhitespace()
        
        return result
    }
    
}

extension CreateBlogInteractor: CreateBlogInteractorInput {
    
    func safeDraft() {
        if  !defaultDraft.text.isEmpty ||
            !defaultDraft.title.isEmpty {
            
            var finalDraft = defaultDraft
            finalDraft.date = .init()
            
            let draftBlog = Blog(user: defaultUser,
                                 title: finalDraft.title.isEmpty ? finalDraft.text : finalDraft.title,
                                 dateCreate: .init(),
                                 finalPost: finalDraft,
                                 arrayTags: [],
                                 arrayLikeUsers: [],
                                 arrayShareUsers: [],
                                 rating: 0,
                                 identifier: "")
            
            
            defaultUser.arrayDrafts.insert(draftBlog, at: 0)
            UserManager.addBlog(blog: defaultUser.arrayDrafts[0], nameArray: "arrayDrafts", queue: updateQueue)
        } else {
            updateQueue.activate()
        }
        
        defaultDraft = Post(date: .init(),
                            title: "",
                            text: "",
                            arrayTags: [])
        
        updateQueue.async {
            DispatchQueue.main.async {
                self.output?.openBackController()
            }
        }
    }
    
    func giveText() {
        output?.transferText(text: defaultDraft.text)
    }

    func verificationOfEnteredData() {
        if !defaultDraft.text.isEmpty {
            output?.openAdditionblog(defaultDraft)
        } else {
            output?.callAlert()
        }
    }
    
    func getText(text: String) {
        defaultDraft.text = clearText(text)
    }
    
    func getUtility(at indexPath: IndexPath) {
        output?.utilityDidRecieve(utilitiesArray[indexPath.row])
    }
    
    func fetchUtilies() {
        output?.utiliesDidRecieve(utilitiesArray)
    }
    
}
