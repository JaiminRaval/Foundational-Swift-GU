//
//  JokeModel.swift
//
//  Created by Jaimin Raval on 23/02/26.
//

import Foundation

struct JokeModel: Codable {
    var id: Int
    var type: String
    var setup: String
    var punchline: String
}
