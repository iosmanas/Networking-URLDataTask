//
//  Post.swift
//  Networking-URLDataTask
//
//  Created by new on 3/2/23.
//

import Foundation

struct Post: Decodable, Encodable {
    let id: Int
    let title: String
    let body: String
}
