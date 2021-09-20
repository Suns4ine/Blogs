//
//  BlogsUITests.swift
//  BlogsUITests
//
//  Created by Vyacheslav Pronin on 25.07.2021.
//

import XCTest

class BlogsUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
      try super.setUpWithError()
      continueAfterFailure = false

      app = XCUIApplication()
      app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }

    func testTabBarController() throws {

        let app = XCUIApplication()
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Поиск"].tap()
        tabBar.buttons["Понравилось"].tap()
        tabBar.buttons["Профиль"].tap()

        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Изменить"]/*[[".buttons[\"Изменить\"].staticTexts[\"Изменить\"]",".staticTexts[\"Изменить\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        scrollViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 0).children(matching: .button).element.tap()

    }
}
