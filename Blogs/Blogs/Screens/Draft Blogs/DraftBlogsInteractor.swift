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
}

extension DraftBlogsInteractor: DraftBlogsInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        defaultUser.arrayDrafts.remove(at: indexPath.row)
        
        output?.indexDeleteReiceve(indexPath)
    }
    
    
    func getBlog(at indexPath: IndexPath) {
        let blog = defaultUser.arrayDrafts[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(defaultUser.arrayDrafts)
    }
}
