//
//  Message.swift
//  iOSTest
//
//  Created by Greg Hughes on 2/6/20.
//  Copyright © 2020 D&ATechnologies. All rights reserved.
//

import Foundation


struct TopLevelDictionary : Codable {
    
    var data : [Message]
    
}

struct Message : Codable {
    var userID : String
    var username : String
    var avatarURL : URL
    var text : String
    
    init(testName : String, withTestMessage: String) {
        self.username = testName
        self.text = withTestMessage
        self.avatarURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png")!
        self.userID = "0"
    }
    
    enum CodingKeys: String,CodingKey {
        case userID = "user_id"
        case username = "name"
        case avatarURL = "avatar_url"
        case text = "message"
    }
}
