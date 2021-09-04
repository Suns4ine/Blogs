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
    
   // private var arrayBlogs: [Blog] = defaultUser.arrayBlogs
}
//MARK: Убрать дефолтного юзера
extension MyProfileInteractor: MyProfileInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        defaultUser.arrayBlogs.remove(at: indexPath.row)
        
        output?.indexDeleteReiceve(indexPath)
    }
    
    func giveMyProfile() {
        output?.giveAwayMyProfile(profile: defaultUser)
    }
    
    func giveBlogsArrayCount() -> Int {
        return defaultUser.arrayBlogs.count
    }
    
    
    func getBlog(at indexPath: IndexPath) {
        let blog = defaultUser.arrayBlogs[indexPath.row]
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        output?.blogsDidRecieve(defaultUser.arrayBlogs)
    }
}
