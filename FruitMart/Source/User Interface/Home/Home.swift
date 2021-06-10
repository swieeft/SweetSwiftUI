//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            ProductRow(product: Product.productSamples[0])
            ProductRow(product: Product.productSamples[1])
            ProductRow(product: Product.productSamples[2])
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
