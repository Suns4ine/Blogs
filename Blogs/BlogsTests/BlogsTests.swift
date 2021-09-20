//
//  BlogsTests.swift
//  BlogsTests
//
//  Created by Vyacheslav Pronin on 20.09.2021.
//


import XCTest

@testable import Blogs

class BlogsTests: XCTestCase {
    
    var previewContainer: PreviewContainer!
    var loginContainer: LoginContainer!
    var signUpContainer: SignUpContainer!
    var blogContainer: BlogContainer!
    var userManager: UserManager!
    var blog: Blog!

    override func setUp() {
        super.setUp()
        previewContainer = PreviewContainer.assemble(with: .init())
        loginContainer = LoginContainer.assemble(with: .init())
        signUpContainer = SignUpContainer.assemble(with: .init())
        blogContainer = BlogContainer.assemble(with: .init())
        blog = Blog(user: defaultUser,
                    title: "Title",
                    dateCreate: .init(),
                    finalPost: Post(date: .init(),
                                    title: "Title",
                                    text: "Text",
                                    arrayTags: ["1", "2"]),
                    arrayTags: ["1", "2"],
                    arrayLikeUsers: Set(),
                    arrayShareUsers: Set(),
                    rating: 0,
                    identifier: "")
    }

    override func tearDown() {
        previewContainer = nil
        loginContainer = nil
        signUpContainer = nil
        blog = nil
        super.tearDown()
    }

    func test_is_valid_controller() throws {
        XCTAssertNoThrow(previewContainer.viewController.view)
        XCTAssertNoThrow(loginContainer.viewController.view)
        XCTAssertNoThrow(signUpContainer.viewController.view)
        XCTAssertNoThrow(blogContainer.input.setupBlog(blog: blog))
        XCTAssertNoThrow(blogContainer.viewController.view)
    }
}
