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
    
    private var blogArray: [Blog] = defaultUser.arrayBlogs
}

extension MyMoreBlogsInteractor: MyMoreBlogsInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        blogArray.remove(at: indexPath.row)
        defaultUser.arrayBlogs = blogArray
        
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
