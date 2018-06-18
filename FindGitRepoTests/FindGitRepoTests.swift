//
//  FindGitRepoTests.swift
//  FindGitRepoTests
//
//  Created by Shashank Mishra on 25/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import XCTest
@testable import FindGitRepo

class FindGitRepoTests: XCTestCase {
    
    var httpClient: HttpClient!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        httpClient = HttpClient.shared
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetGitRepo() {
        
        let expect = expectation(description: "Wait for repo list to load.")
        
        guard let url = URL(string: "https://api.github.com/search/repositories?q=Java+language:Java+sort=stars&order=desc") else {
            fatalError("URL can't be empty")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/vnd.github.mercy-preview+json", forHTTPHeaderField: "Accept")
        httpClient.get(urlRequest) { (success, response) in
            // Return data
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetRepoIssues() {
        
        let expect = expectation(description: "Wait for repo list to load.")
        
        guard let url = URL(string: "https://api.github.com/search/issues?q=repo:cncf/landscape+sort=created&order=desc") else {
            fatalError("URL can't be empty")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/vnd.github.v3.text-match+json", forHTTPHeaderField: "Accept")
        httpClient.get(urlRequest) { (success, response) in
            // Return data
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetRepoContributors() {
        
        let expect = expectation(description: "Wait for repo list to load.")
        
        guard let url = URL(string: "https://api.github.com/repos/cncf/landscape/contributors") else {
            fatalError("URL can't be empty")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/vnd.github.v3.text-match+json", forHTTPHeaderField: "Accept")
        httpClient.get(urlRequest) { (success, response) in
            // Return data
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetGitRepoResume() {
        
        let expect = expectation(description: "Wait for repo list to load.")
        
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        
        guard let url = URL(string: "https://api.github.com/search/repositories?Swift=J+language:Swift+sort=stars&order=desc") else {
            fatalError("URL can't be empty")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/vnd.github.mercy-preview+json", forHTTPHeaderField: "Accept")
        httpClient.get(urlRequest) { (success, response) in
            // Return data
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
