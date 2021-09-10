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
        let array = Array(defaultUser.arrayLikedBlogs)
        
        if array.indices.contains(indexPath.row) {
            let blog = Array(defaultUser.arrayLikedBlogs)[indexPath.row]
            playSound(name: .openController)
            
            output?.blogDidRecieve(blog)
        } else {
            deleteBlog(at: indexPath)
        }
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(Array(defaultUser.arrayLikedBlogs))
    }
}
