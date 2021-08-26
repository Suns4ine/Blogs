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
    
    private var draftArray: [Blog] = [.init(), .init(), .init(), .init(), .init()]
}

extension DraftBlogsInteractor: DraftBlogsInteractorInput {
    
    func getBlog(at indexPath: IndexPath) {
        let blog = draftArray[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(draftArray)
    }
}
