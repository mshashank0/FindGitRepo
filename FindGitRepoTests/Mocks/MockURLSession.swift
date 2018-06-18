//
//  MockURLSession.swift
//  FindGitRepo
//  Created by Shashank Mishra on 28/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import Foundation

class MockURLSession {
    
    var nextDataTask = MockURLSessionDataTask()
    var nextData: Data?
    var nextError: Error?
    var nextResponse: HTTPURLResponse?
    
    private (set) var lastURL: URL?
    
    func successHttpURLResponse(request: NSURLRequest) -> URLResponse {
        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTPS/1.1", headerFields: nil)!
    }
    
}
