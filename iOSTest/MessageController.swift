//
//  Message.swift
//  iOSTest
//
//  Created by Greg Hughes on 2/6/20.
//  Copyright © 2020 D&ATechnologies. All rights reserved.
//

import Foundation
import UIKit


class MessageController {
    
    var messages : [Message] = []
    static let imageCache = NSCache<NSString, UIImage>()
    
    static func fetchImage(message: Message, completion: @escaping (UIImage?) -> Void) {
        
        
        URLSession.shared.dataTask(with: message.avatarURL) { (data, reponse, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
                completion(nil)
                return
            }
            
            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); completion(nil);return}
            
            
            let image = UIImage(data: data)
            
            MessageController.imageCache.setObject(image ?? UIImage(), forKey: message.userID as NSString)
            
            
            completion(image)
            
        }.resume()
    }
    ///VV ATTENTION ALL THE STUFF BELOW HERE IS THE SWIFT VERSION OF THE OBJECTIVE C CODE
    
    
    
    //    static func fetchChat(completion: @escaping ([Message]?) -> Void) {
    //
    //        guard let baseUrl = URL(string:"https://api.jsonbin.io/b/5d769a01b6d0e614dd190aff/1") else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
    //
    //
    //        URLSession.shared.dataTask(with: baseUrl) { (data, response, error) in
    //            if let error = error {
    //                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription) : \(#file) \(#line)")
    //                completion(nil)
    //                return
    //            }
    //
    //            guard let data = data else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<");completion(nil); return}
    //
    //            let jsonDecoder = JSONDecoder()
    //
    //            do {
    //
    //                let topLevelDict = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
    //                let messages = topLevelDict.data
    //                print(messages)
    //                completion(messages)
    //            }catch {
    //                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
    //            }
    //
    //
    //        }.resume()
    //    }
}

//struct TopLevelDictionary : Codable {
//    
//    var data : [Message]
//    
//}
//
//struct Message : Codable {
//    var userID : String
//    var username : String
//    var avatarURL : URL
//    var text : String
//    
//    
//    init(testName : String, withTestMessage: String) {
//        self.username = testName
//        self.text = withTestMessage
//        self.avatarURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png")!
//        self.userID = "0"
//    }
//    
//    enum CodingKeys: String,CodingKey {
//        case userID = "user_id"
//        case username = "name"
//        case avatarURL = "avatar_url"
//        case text = "message"
//    }
//}
