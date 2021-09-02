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
    
    private var savedArray: [Blog] = [defaultBlog, defaultBlog, defaultBlog, defaultBlog, defaultBlog]//[.init(), .init(), .init(), .init(), .init(), .init()] 
}

extension SavedInteractor: SavedInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        savedArray.remove(at: indexPath.row)
        
        output?.indexDeleteReiceve(indexPath)
    }
    
    
    func getBlog(at indexPath: IndexPath) {
        let blog = savedArray[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(savedArray)
    }
}
