//
//  LobstersClient.swift
//  Claws
//
//  Created by David Peredo on 4/7/17.
//  Copyright © 2017 Wet Nose Labs. All rights reserved.
//

import Foundation

enum LobstersClientError: Error {
    case networkError
    case serializationError
}

class LobstersClient {
    static let shared = LobstersClient()
    
    static let baseURL = "https://lobste.rs/"
    
    let session: URLSession
    let deserializer: LobstersDeserializer
    
    init() {
        session = URLSession(configuration: URLSessionConfiguration.default)
        deserializer = LobstersDeserializer()
    }
    
    func getHottest(completion: @escaping ([Post]?, LobstersClientError?) -> Void) {
        let url = URL(string: LobstersClient.baseURL + "hottest.json")!
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil, .networkError)
                return
            }
            
            do {
                let posts: [Post] = try self.deserializer.deserializeArray(data: data)
                completion(posts, nil)
                
            } catch {
                completion(nil, .serializationError)
                return
            }
        })
        
        task.resume()
    }
}
