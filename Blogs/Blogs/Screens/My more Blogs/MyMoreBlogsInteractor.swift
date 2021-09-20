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
}

extension MyMoreBlogsInteractor: MyMoreBlogsInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        
        if defaultUser.arrayBlogs.indices.contains(indexPath.row) {
            defaultUser.arrayBlogs[indexPath.row].deleteBlog()
            defaultUser.arrayBlogs.remove(at: indexPath.row)
        }
        
        output?.indexDeleteReiceve(indexPath)
    }
    
    func getBlog(at indexPath: IndexPath) {
        let blog = defaultUser.arrayBlogs[indexPath.row]
        playSound(name: .openController)
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(defaultUser.arrayBlogs)
    }
}
