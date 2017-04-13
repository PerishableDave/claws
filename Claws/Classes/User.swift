//
//  User.swift
//  Claws
//
//  Created by David Peredo on 4/13/17.
//  Copyright © 2017 Wet Nose Labs. All rights reserved.
//

import Foundation

class User: Decodable {
    let username: String
    let createdAt: String
    let profile: String
    let isAdmin: Bool
    let isModerator: Bool
    let karma: Int
    let avatarURL: String
    
    required init?(dict: Dictionary<String, AnyObject>) {
        guard let username = dict["username"] as? String,
            let createdAt = dict["created_at"] as? String,
            let profile = dict["about"] as? String,
            let isAdmin = dict["is_admin"] as? Bool,
            let isModerator = dict["is_moderator"] as? Bool,
            let karma = dict["karma"] as? Int,
            let avatarURL = dict["avatar_url"] as? String else {
                return nil
        }
        
        self.username = username
        self.createdAt = createdAt
        self.profile = profile
        self.isAdmin = isAdmin
        self.isModerator = isModerator
        self.karma = karma
        self.avatarURL = avatarURL
    }
}
