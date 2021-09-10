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
    
    
    private var blogArray: [Blog] = [defaultBlog, defaultBlog, defaultBlog, defaultBlog, defaultBlog]//[.init(), .init(), .init(), .init(), .init()]
}

extension AnotherMoreBlogsInteractor: AnotherMoreBlogsInteractorInput {
    func getBlog(at indexPath: IndexPath) {
        let blog = blogArray[indexPath.row]
        playSound(name: .openController)
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(blogArray)
    }
}
