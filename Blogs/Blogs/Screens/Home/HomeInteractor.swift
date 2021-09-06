//
//  HomeInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 11.08.2021.
//  
//

import Foundation

final class HomeInteractor {
	weak var output: HomeInteractorOutput?
    
    private var arrayBlogs: [Blog] = [anotherDefaultBlog, defaultBlog, defaultBlog, defaultBlog, defaultBlog, defaultBlog]//[.init(), .init(), .init(), .init(), .init(), .init(), .init(), .init()]
    
}

extension HomeInteractor: HomeInteractorInput {
    
    func getBlog(at indexPath: IndexPath) {
        let blog = arrayBlogs[indexPath.row]
        
        output?.blogDidRecieve(blog)
        
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(arrayBlogs)
    }
    
    func getUser(at indexPath: Int) {
        let user = arrayBlogs[indexPath].user
        
        output?.userDidRecieve(user)
    }
}
