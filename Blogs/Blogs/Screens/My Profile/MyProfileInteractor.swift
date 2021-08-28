//
//  MyProfileInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 12.08.2021.
//  
//

import Foundation

final class MyProfileInteractor {
	weak var output: MyProfileInteractorOutput?
    
    private var arrayBlogs: [Blog] = []//[.init(), .init(), .init(), .init(), .init()]
}

extension MyProfileInteractor: MyProfileInteractorInput {
    func giveBlogsArrayCount() -> Int {
        return arrayBlogs.count
    }
    
    
    func getBlog(at indexPath: IndexPath) {
        let blog = arrayBlogs[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(arrayBlogs)
    }
}
