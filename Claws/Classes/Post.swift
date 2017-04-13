//
//  Post.swift
//  Claws
//
//  Created by David Peredo on 4/7/17.
//  Copyright © 2017 Wet Nose Labs. All rights reserved.
//

import Foundation

class Post: Decodable {
    let shortId: String
    let shortURL: String
    let title: String
    let URL: String
    let score: Int
    let upvotes: Int
    let downvotes: Int
    let submitter: User
    
    required init?(dict: Dictionary<String, AnyObject>) {
        guard let shortId = dict["short_id"] as? String,
            let shortURL = dict["short_id_url"] as? String,
            let title = dict["title"] as? String,
            let URL = dict["url"] as? String,
            let score = dict["score"] as? Int,
            let upvotes = dict["upvotes"] as? Int,
            let downvotes = dict["downvotes"] as? Int,
            let submitterDict = dict["submitter_user"] as? Dictionary<String, AnyObject> else {
            return nil
        }
        
        guard let submitter = User(dict: submitterDict) else {
            return nil
        }
        
        self.shortId = shortId
        self.shortURL = shortURL
        self.title = title
        self.URL = URL
        self.score = score
        self.upvotes = upvotes
        self.downvotes = downvotes
        self.submitter = submitter
    }
}
