//
//  FindGitRepoUITests.swift
//  FindGitRepoUITests
//
//  Created by Shashank Mishra on 25/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import XCTest

class FindGitRepoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBasicFlow() {
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let jKey = app/*@START_MENU_TOKEN@*/.keys["J"]/*[[".keyboards.keys[\"J\"]",".keys[\"J\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        jKey.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["v"]/*[[".keyboards.keys[\"v\"]",".keys[\"v\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        aKey.tap()
        
        let findRepositoriesButton = app.buttons["Find Repositories"]
        findRepositoriesButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["git://github.com/iamsmriti/Githubreposearch-app.git"]/*[[".cells.staticTexts[\"git:\/\/github.com\/iamsmriti\/Githubreposearch-app.git\"]",".staticTexts[\"git:\/\/github.com\/iamsmriti\/Githubreposearch-app.git\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let findgitrepoRepositorydetailsviewNavigationBar = app.navigationBars["FindGitRepo.RepositoryDetailsView"]
        findgitrepoRepositorydetailsviewNavigationBar.buttons["Java"].tap()
        app.navigationBars["Java"].buttons["Back"].tap()
       
        
    }
    
}
