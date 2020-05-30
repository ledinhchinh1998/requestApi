//
//  UserModel.swift
//  CocoaPodTest
//
//  Created by Chinh le on 5/29/20.
//  Copyright © 2020 Chinh le. All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel: Mappable {
    var errorCode: Int?
    var message: String?
    var data: [DataModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        errorCode <- map["errorCode"]
        message <- map["message"]
        data <- map["data"]
    }
}

class DataModel: Mappable {
    
    var id: Int?
    var name: String?
    var detail: String?
    var img: String?
    
    init(id: Int?, name: String?, detail: String?, img: String?) {
        self.id = id
        self.name = name
        self.detail = detail
        self.img = img
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        detail <- map["detail"]
        img <- map["image"]
    }
}
