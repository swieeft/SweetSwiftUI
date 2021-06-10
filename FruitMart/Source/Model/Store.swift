//
//  Store.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/10.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import Foundation

final class Store {
    var products: [Product]
    
    init(fileName: String = "ProductData.json") {
        self.products = Bundle.main.decode(fileName: fileName, as: [Product].self)
    }
    
    init(products: [Product]) {
        self.products = products
    }
}
