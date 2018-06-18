//
//  HttpClient.swift
//  FindGitRepo
//  Created by Shashank Mishra on 28/05/18.
//  Copyright © 2018 Shashank Mishra. All rights reserved.
//

import Foundation

class HttpClient {
        
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    
    static let shared = HttpClient()
    
    let session: URLSession = URLSession.shared
    
    func get(_ request: URLRequest, callback: @escaping completeClosure ) {
        let task = self.session.dataTask(with: request) { (data, response, error) in
            callback(data, error)
        }
        task.resume()
    }
    
}


