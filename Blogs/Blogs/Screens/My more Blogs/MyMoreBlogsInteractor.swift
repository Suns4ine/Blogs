//
//  MyMoreBlogsInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 24.08.2021.
//  
//

import Foundation

final class MyMoreBlogsInteractor {
	weak var output: MyMoreBlogsInteractorOutput?
    
    private var blogArray: [Blog] = [defaultBlog, defaultBlog, defaultBlog, defaultBlog, defaultBlog]//[.init(), .init(), .init(), .init(), .init()]
}

extension MyMoreBlogsInteractor: MyMoreBlogsInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        blogArray.remove(at: indexPath.row)
        
        output?.indexDeleteReiceve(indexPath)
    }
    
    func getBlog(at indexPath: IndexPath) {
        let blog = blogArray[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(blogArray)
    }
}
