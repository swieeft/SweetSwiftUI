//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject private var store: Store
    @State private var quickOrder: Product?
    
    var body: some View {
        NavigationView {
            List(store.products) { product in
                NavigationLink(
                    destination: ProductDetailView(product: product),
                    label: {
                        ProductRow(product: product, quickOrder: self.$quickOrder)
                    })
            }
            .navigationBarTitle("과일마트")
        }
        .popupOverContext(item: $quickOrder, style: .dimmed, content: popupMessage(product:))
    }
    
    func popupMessage(product: Product) -> some View {
        let name = product.name.split(separator: " ").last!
        
        return VStack {
            Text(name)
                .font(.title).bold().kerning(3)
                .foregroundColor(.peach)
                .padding()
            
            OrderCompletedMessage()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        return Home().environmentObject(Store(products: Product.productSamples))
    }
}
