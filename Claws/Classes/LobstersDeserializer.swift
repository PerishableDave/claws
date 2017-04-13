//
//  LobstersDeserializer.swift
//  Claws
//
//  Created by David Peredo on 4/8/17.
//  Copyright © 2017 Wet Nose Labs. All rights reserved.
//

import Foundation

enum LobstersDeserializerError: Error {
    case badType
}

class LobstersDeserializer {
    func deserializeArray<T>(data: Data) throws -> [T] where T: Decodable {
        guard let dictArray = try JSONSerialization.jsonObject(with: data, options: []) as? Array<Dictionary<String, AnyObject>> else {
            throw LobstersDeserializerError.badType
        }
        
        var array: [T] = [T]()
        for dict in dictArray {
            if let obj = T(dict: dict) {
                array.append(obj)
            }
        }
        
        return array
    }
}
