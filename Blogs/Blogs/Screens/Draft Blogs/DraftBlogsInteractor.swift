//
//  DraftBlogsInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class DraftBlogsInteractor {
	weak var output: DraftBlogsInteractorOutput?
    
    private func safeDraft(_ blog: Blog) {
        if  !defaultDraft.text.isEmpty ||
            !defaultDraft.title.isEmpty {
            
            var finalDraft = defaultDraft
            finalDraft.date = .init()
            
            let draftBlog = Blog(user: defaultUser,
                                 title: finalDraft.title.isEmpty ? finalDraft.text : finalDraft.title,
                                 dateCreate: .init(),
                                 dateEdit: nil,
                                 finalPost: finalDraft,
                                 arrayTags: [],
                                 arrayLikeUsers: [],
                                 arrayShareUsers: [],
                                 rating: 0,
                                 identifier: "")
            
            
            defaultUser.arrayDrafts.insert(draftBlog, at: 0)
        }
        
        defaultDraft = blog.finalPost
        defaultDraft.date = .init()
    }
}

extension DraftBlogsInteractor: DraftBlogsInteractorInput {
    

    
    func deleteBlog(at indexPath: IndexPath) {
        defaultUser.arrayDrafts.remove(at: indexPath.row)
        
        output?.indexDeleteReiceve(indexPath)
    }
    
    
    func getBlog(at indexPath: IndexPath) {
        let blog = defaultUser.arrayDrafts.remove(at: indexPath.row)
        playSound(name: .closeController)
        
        safeDraft(blog)
        output?.openBackController()
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(defaultUser.arrayDrafts)
    }
}
