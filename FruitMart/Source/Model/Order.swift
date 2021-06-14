//
//  Order.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/14.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import Foundation

struct Order: Identifiable {
    static var orderSequence = sequence(first: 1, next: { $0 + 1 })
    
    let id: Int
    let product: Product
    let quantity: Int
    
    var price: Int {
        product.price * quantity
    }
}
