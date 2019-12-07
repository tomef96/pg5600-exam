//
//  Api.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 14/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import Foundation

class Api {
    static func apiGetArray<T: Decodable>(url: URL, subpath: [String], callback: @escaping ([T]) -> Void) {
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {print(error)}
            guard let data = data else {return}
            
            let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
            
            var target: [AnyObject] = []
            
            if subpath.count == 1 {
                target = json[subpath[0]] as? [AnyObject] ?? []
            } else {
                var prevPath: [String: AnyObject] = [:]
                for i in 0...subpath.count-1 {
                    if i == 0 {
                        prevPath = json[subpath[i]] as! [String: AnyObject]
                    }
                    else if i < subpath.count-1 {
                        prevPath = prevPath[subpath[i]] as! [String: AnyObject]
                    } else {
                        target = prevPath[subpath[i]] as! [AnyObject]
                    }
                }
            }
            
            var result: [T] = []
            for t in target {
                let jsonRepresentation = t as! [String: Any]
                let dataRepresentation = try! JSONSerialization.data(withJSONObject: jsonRepresentation, options: .fragmentsAllowed)
                let decodedObject = try! JSONDecoder().decode(T.self, from: dataRepresentation)
                result.append(decodedObject)
            }
    
            callback(result)
        }.resume()
    }
}
