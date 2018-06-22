//
//  Models.swift
//  CABi
//
//  Created by C4Q on 6/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation


struct Task: Codable {
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let licenseNumber: String
    let hackLicense: String
    //Will convert into dictionary where keys are indicies
    //let arr: [String] = ["test", "strings", "are", "here"]
    func toJSON() -> Any {
        let jsonData = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: jsonData, options: [])
    }
}
