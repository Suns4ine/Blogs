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
    
    //MARK: ОСторожно
    private let updateQueue = DispatchQueue(label: "updateQueueMyProfile",
                                            qos: .userInteractive,
                                            attributes: .concurrent,
                                            autoreleaseFrequency: .workItem)
}
//MARK: Убрать дефолтного юзера
extension MyProfileInteractor: MyProfileInteractorInput {
    func deleteBlog(at indexPath: IndexPath) {

        if defaultUser.arrayBlogs.indices.contains(indexPath.row) {

            defaultUser.arrayBlogs[indexPath.row].deleteBlog()
            defaultUser.arrayBlogs.remove(at: indexPath.row)
            UserManager.updateBlogs(blogs: defaultUser.arrayBlogs, nameArray: "arrayBlogs", queue: updateQueue)
        }
        
        
        updateQueue.async {
            DispatchQueue.main.async {
                self.output?.indexDeleteReiceve(indexPath)
            }
        }

    }
    
    func giveMyProfile() {
     //   UserManager.getDocument(queue: DispatchQueue.main)
        
       // updateQueue.async {
            DispatchQueue.main.async {
                self.output?.giveAwayMyProfile(profile: defaultUser)
                self.output?.blogsDidRecieve(defaultUser.arrayBlogs)
            }
        //}
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
