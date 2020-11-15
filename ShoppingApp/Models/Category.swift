//
//  Category.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/11/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

struct Category: ATCGenericBaseModel, ATCGenericFirebaseParsable {
    var description: String {
        return title
    }

    let imageURLString: String
    let title: String
    let colorString: String
    let id: String
    var key: String = ""

    init(jsonDict: [String: Any]) {
        self.id = (jsonDict["id"] as? String) ?? ""
        self.imageURLString = (jsonDict["image_url"] as? String) ?? ""
        self.title = (jsonDict["name"] as? String) ?? ""
        self.colorString = (jsonDict["color"] as? String) ?? ""
    }

    init(key: String, jsonDict: [String: Any]) {
        self.init(jsonDict: jsonDict)
        self.key = key
    }
}
