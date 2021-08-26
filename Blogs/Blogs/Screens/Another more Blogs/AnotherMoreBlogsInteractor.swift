//
//  AnotherMoreBlogsInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

final class AnotherMoreBlogsInteractor {
	weak var output: AnotherMoreBlogsInteractorOutput?
    
    
    private var blogArray: [Blog] = [.init(), .init(), .init(), .init(), .init()]
}

extension AnotherMoreBlogsInteractor: AnotherMoreBlogsInteractorInput {
    func getBlog(at indexPath: IndexPath) {
        let blog = blogArray[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(blogArray)
    }
}
