//
//  WordPressPost.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 10/22/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

class WordPressPost: ATCGenericBaseModel {
    let imageURLString: String
    var title: String = ""

    required init(jsonDict: [String: Any]) {
        self.imageURLString = (jsonDict["image_url"] as? String) ?? ""

        if let title = jsonDict["title"] as? [String: String] {
            self.title = title["rendered"] ?? ""
        }
    }

    var description: String {
        return title
    }
}
