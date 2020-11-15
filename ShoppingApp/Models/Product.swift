//
//  Product.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 10/15/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

struct Product: ATCShoppingCartProduct, ATCGenericBaseModel, ATCGenericFirebaseParsable {
    var description: String {
        return title
    }

    let imageURLString: String
    let title: String
    let price: String
    let images: [String]
    let productDescription: String
    var id: String
    var key: String  = ""

    init(jsonDict: [String: Any]) {
        self.imageURLString = (jsonDict["image_url"] as? String) ?? ""
        self.title = (jsonDict["name"] as? String) ?? ""
        self.price = String(describing: (jsonDict["price"] as? Int) ?? 0)
        self.productDescription = (jsonDict["description"] as? String) ?? ""
        self.images = jsonDict["images"] as? [String] ?? [String]()
        self.id = (jsonDict["id"] as? String) ?? ""
    }

    init(key: String, jsonDict: [String: Any]) {
        self.init(jsonDict: jsonDict)
        self.key = key
    }

    // MARK: - ATCShoppingCartProduct

    var cartId: String {
        return id
    }

    var cartTitle: String {
        return title
    }

    var cartImageURLString: String {
        return imageURLString
    }

    var cartPrice: Double {
        return Double(price) ?? 0
    }
}
