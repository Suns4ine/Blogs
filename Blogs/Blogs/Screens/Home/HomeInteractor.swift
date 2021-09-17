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
    
    private var arrayBlogs: [Blog] = User.arrayAnotherBlogs()
}

extension HomeInteractor: HomeInteractorInput {
    
    func getBlog(at indexPath: IndexPath) {
        let blog = arrayBlogs[indexPath.row]
        playSound(name: .openController)
        
        output?.blogDidRecieve(blog)
        
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(arrayBlogs)
    }
    
    func getUser(at indexPath: Int) {
        let user = arrayBlogs[indexPath].user
        playSound(name: .openController)
        
        output?.userDidRecieve(user)
    }
}
