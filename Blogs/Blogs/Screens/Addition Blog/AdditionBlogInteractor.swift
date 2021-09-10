//
//  AdditionBlogInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 14.08.2021.
//  
//

import Foundation

final class AdditionBlogInteractor {
	weak var output: AdditionBlogInteractorOutput?
    
    private func checkName(name: String) -> Bool {
        let text = name.condenseWhitespace()
        
        switch text {
        case let text where text.isEmpty:
            output?.transferErrorName(text: "Пустое поле")
            return false
        case let text where text.count < 6:
            output?.transferErrorName(text: "Минимум 6 символов")
            return false
        case let text where text.count > 250:
            output?.transferErrorName(text: "Максимум 250 символов")
            return false
        default:
            output?.transferErrorName(text: "")
            return true
        }
    }
    
    private func checkTagName(tag: String) -> Bool {
        let text = tag.trimmingCharacters(in: .whitespaces)
        
        switch text {
        case let text where text.count < 2:
            output?.transferErrorTagName(text: "Минимум 2 символов тега")
            return false
        case let text where text.count > 20:
            output?.transferErrorTagName(text: "Максимум 20 символов тега")
            return false
        default:
            output?.transferErrorTagName(text: "")
            return true
        }
    }
    
    private func clearDraft() {
        defaultDraft = .init(date: .init(),
                             title: "",
                             text: "",
                             arrayTags: [])
    }
    
    private func createBlog(draft: Post) -> Blog {
        let blog = Blog(user: defaultUser,
                        title: draft.title,
                        dateCreate: .init(),
                        dateEdit: nil,
                        finalPost: draft,
                        arrayTags: draft.arrayTags,
                        arrayLikeUsers: [],
                        arrayShareUsers: [],
                        rating: 0,
                        identifier: UUID().uuidString)
        return blog
    }
}

extension AdditionBlogInteractor: AdditionBlogInteractorInput {
    
    
    func giveText() {
        output?.transferTitle(text: defaultDraft.title)
        output?.transferTags(text: defaultDraft.arrayTags.returnEnumerationString())
    }
    
    
    func newNameText(text: String) {
        defaultDraft.title = text
    }
    
    
    func newTagNameText(text: String) {
        let array = text.components(separatedBy: " ")
        defaultDraft.arrayTags = array.filter{ $0 != ""}
    }
    
    func verificationOfEnteredData() {

        if defaultDraft.arrayTags.count > 10 {
            output?.transferErrorTagName(text: "Максимум 10 тегов")
            return
        }
        
        for tag in defaultDraft.arrayTags {
            if checkTagName(tag: tag) == false { return }
        }
        
        if checkName(name: defaultDraft.title) {
            defaultDraft.date = .init()
            defaultUser.arrayBlogs.insert(createBlog(draft: defaultDraft), at: 0)
            clearDraft()
            output?.openMyProfile()
        }
    }
}
