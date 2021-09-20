//
//  AnotherProfileInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//  
//

import Foundation

final class AnotherProfileInteractor {
	weak var output: AnotherProfileInteractorOutput?
    
    private var anotherUser: User?
}

extension AnotherProfileInteractor: AnotherProfileInteractorInput {
    func getBlogs() {
        guard let anotherUser = anotherUser else { return }
        output?.openAnotherMoreBlogsblogs(blogs: anotherUser.arrayBlogs)
    }
    
    func setupUser(user: User) {
        anotherUser = user
    }
    
    func giveStatus() {
        guard let anotherUser = anotherUser else { return }
        
        if defaultUser.arrayFolloving.contains(anotherUser) {
            output?.updateStatus(text: StandartLanguage.statusOnFollowButtonAnotherProfileScreen)
        } else {
            output?.updateStatus(text: StandartLanguage.statusOffFollowButtonAnotherProfileScreen)
        }
    }
    
    func subscribe() {
        guard let anotherUser = anotherUser else { return }
        
        if defaultUser.arrayFolloving.contains(anotherUser),
           anotherUser.arrayFollowers.contains(defaultUser) {
            
            defaultUser.arrayFolloving.remove(anotherUser)
            anotherUser.arrayFollowers.remove(defaultUser)
        } else {
            if defaultUser.arrayFolloving.count < 2500 {
                
                defaultUser.arrayFolloving.insert(anotherUser)
                anotherUser.arrayFollowers.insert(defaultUser)
            }
        }
        fetchBlogs()
        giveStatus()
        giveAnotherProfile()
    }
    
    func giveAnotherProfile() {
        guard let anotherUser = anotherUser else { return }
        output?.giveAwayAnotherProfile(profile: anotherUser)
    }
    
    func giveBlogsArrayCount() -> Int {
        guard let anotherUser = anotherUser else { return 0 }
        return anotherUser.arrayBlogs.count
    }
    
    func getBlog(at indexPath: IndexPath) {
        guard let anotherUser = anotherUser else { return }
        
        let blog = anotherUser.arrayBlogs[indexPath.row]
        playSound(name: .openController)
        
        output?.blogDidRecieve(blog)
    }
    
    func fetchBlogs() {
        guard let anotherUser = anotherUser else { return }
        output?.blogsDidRecieve(anotherUser.arrayBlogs)
    }
}
