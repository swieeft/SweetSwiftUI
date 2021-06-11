//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    let store: Store
    
    var body: some View {
        NavigationView {
            List(store.products, id: \.name) { product in
                NavigationLink(
                    destination: ProductDetailView(product: product),
                    label: {
                        ProductRow(product: product)
                    })
            }
            .navigationBarTitle("과일마트")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        return Home(store: Store(products: Product.productSamples))
    }
}
