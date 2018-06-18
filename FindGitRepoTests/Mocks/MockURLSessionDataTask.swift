//
//  MockURLSessionDataTask.swift
//  FindGitRepo
//  Created by Shashank Mishra on 28/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

class MockURLSessionDataTask {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}
