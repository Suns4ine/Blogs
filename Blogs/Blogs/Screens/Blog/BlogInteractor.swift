//
//  BlogInteractor.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 05.09.2021.
//  
//

import Foundation

final class BlogInteractor {
	weak var output: BlogInteractorOutput?
    private var blog: Blog?
    
    private func isMyBlog() {
        guard let blog = blog else { return }
        
        if blog.user == defaultUser {
            output?.setupMyBlog()
        } else {
            output?.setupAnotherBlog()
        }
    }
}

extension BlogInteractor: BlogInteractorInput {

    func tapProfile() {
        guard let blog = blog else { return }
        
        output?.userDidRecieve(blog.user)
    }
    
    func tapLike() {
        guard let blog = blog else { return }
        
        if blog.arrayLikeUsers.contains(defaultUser) {
            defaultUser.arrayLikedBlogs.remove(blog)
            blog.arrayLikeUsers.remove(defaultUser)
        } else {
            defaultUser.arrayLikedBlogs.insert(blog)
            blog.arrayLikeUsers.insert(defaultUser)
        }
        
        giveLike()
    }
    
    func giveLike() {
        guard let blog = blog else { return }
        
        if blog.arrayLikeUsers.contains(defaultUser) {
            output?.updateLike(isOn: true)
        } else {
            output?.updateLike(isOn: false)
        }
    }
    
    func shareBlogs() {
        guard let blog = blog else { return }
        
        output?.transferData(cartage: (blog.title, blog.finalPost.text))
    }
    
    func getBlog(blog: Blog) {
        self.blog = blog
        
        isMyBlog()
    }
    
    func giveStatus() {
        
        guard let blog = blog else { return }
        
        let user = blog.user
        
        guard user != defaultUser else { return }
        
        if defaultUser.arrayFolloving.contains(user) {
            output?.updateStatus(text: StandartLanguage.statusOnFollowButtonAnotherProfileScreen)
        } else {
            output?.updateStatus(text: StandartLanguage.statusOffFollowButtonAnotherProfileScreen)
        }
    }
    
    func transferTextInViews() {
        guard let blog = blog else { return }
        
        let tags = blog.arrayTags.returnEnumerationString().isEmpty ? "Нет тегов" : blog.arrayTags.returnEnumerationString()
        
        output?.transferTitle(text: blog.title)
        output?.transferText(text: blog.finalPost.text)
        output?.transferTags(text: tags)
        output?.transferDate(text: blog.dateCreate.stringDate())
        output?.transferName(text: blog.nameUser)
    }
    
    func subscribe() {
        guard let blog = blog else { return }
        
        let user = blog.user
        
        guard user != defaultUser else { return }
        
        if defaultUser.arrayFolloving.contains(user),
           user.arrayFollowers.contains(defaultUser) {
            
            defaultUser.arrayFolloving.remove(user)
            user.arrayFollowers.remove(defaultUser)
        } else {
            if defaultUser.arrayFolloving.count < 2500 {
                
                defaultUser.arrayFolloving.insert(user)
                user.arrayFollowers.insert(defaultUser)
            }
        }
//        fetchBlogs()
        giveStatus()
//        giveAnotherProfile()
    }
    
}
