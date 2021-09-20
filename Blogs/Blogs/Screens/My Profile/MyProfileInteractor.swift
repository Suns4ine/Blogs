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
}

extension MyProfileInteractor: MyProfileInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {
        
        if defaultUser.arrayBlogs.indices.contains(indexPath.row) {
            defaultUser.arrayBlogs[indexPath.row].deleteBlog()
            defaultUser.arrayBlogs.remove(at: indexPath.row)
        }
        output?.indexDeleteReiceve(indexPath)
    }
    
    func giveMyProfile() {
        output?.giveAwayMyProfile(profile: defaultUser)
        output?.blogsDidRecieve(defaultUser.arrayBlogs)
        UserManager.getDataUser()
    }
    
    func giveBlogsArrayCount() -> Int {
        return defaultUser.arrayBlogs.count
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
