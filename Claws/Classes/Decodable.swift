//
//  Decodable.swift
//  Claws
//
//  Created by David Peredo on 4/7/17.
//  Copyright © 2017 Wet Nose Labs. All rights reserved.
//

import Foundation

protocol Decodable {
    init?(dict: Dictionary<String, AnyObject>)
}
