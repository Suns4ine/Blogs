//
//  SavedInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

final class SavedInteractor {
	weak var output: SavedInteractorOutput?
    
    private var savedArray: [Blog] = Array(defaultUser.arrayLikedBlogs)
}

extension SavedInteractor: SavedInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        let array = Array(defaultUser.arrayLikedBlogs)

        if array.indices.contains(indexPath.row) {
            let deleteBlog =  array[indexPath.row]
            
            deleteBlog.arrayLikeUsers.remove(defaultUser)
            
            defaultUser.arrayLikedBlogs.remove(deleteBlog)
        }
        

        
        output?.indexDeleteReiceve(indexPath)
    }
    
    
    func getBlog(at indexPath: IndexPath) {
        let blog = Array(defaultUser.arrayLikedBlogs)[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(Array(defaultUser.arrayLikedBlogs))
    }
}
