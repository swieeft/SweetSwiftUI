//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/14.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    
    @EnvironmentObject private var store: Store
    let product: Product
    
    private var imageName: String {
        product.isFavorite ? "heart.fill" : "heart"
    }
    
    var body: some View {
        Button(action: {
            self.store.toggleFavorite(of: self.product)
        }, label: {
            Symbol(imageName, scale: .large, color: .peach)
                .frame(width: 32, height: 32)
                .onTapGesture {
                    self.store.toggleFavorite(of: product)
                }
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(product: Product.productSamples[0])
    }
}
