//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/10.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @State private var quantity: Int = 1
    @State private var showingAlert: Bool = false
    @State private var showingPopup: Bool = false
    
    @EnvironmentObject private var store: Store
    
    var body: some View {
        VStack(spacing: 0) {
            productImage
            orderView
        }
//        .modifier(Popup(message: Text("팝업")))
//        .modifier(Popup(style: .blur, message: Text("팝업")))
//        .modifier(Popup(size: CGSize(width: 200, height: 200), style: .dimmed, message: Text("팝업")))
        .popup(isPresented: $showingAlert, style: .blur, content: {
//            Text("팝업")
            OrderCompletedMessage()
        })
        .edgesIgnoringSafeArea([.top, .bottom])
//        .alert(isPresented: $showingAlert, content: {
//            confirmAlert
//        })
    }
    
    var productImage: some View {
        GeometryReader { _ in
            ResizedImage(product.imageName)
//            Image(self.product.imageName)
//                .resizable()
//                .scaledToFill()
        }
    }
    
    var orderView: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                self.productDescription
                Spacer()
                self.priceInfo
                self.placeOrderButton
            }
            .padding(32)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Spacer()
                
                FavoriteButton(product: product)
            }
            
            Text(splitText(product.description))
                .foregroundColor(Color.secondaryText)
                .fixedSize()
        }
    }
    
    var priceInfo: some View {
        let price = quantity * product.price
        
        return HStack {
            (Text("₩")
                + Text("\(price)").font(.title)
            ).fontWeight(.medium)
            
            Spacer()
            QuantitySelector(quantity: $quantity)
        }.foregroundColor(.black)
    }
    
    var placeOrderButton: some View {
        Button(action: {
            self.showingAlert = true
        }, label: {
            Capsule()
                .fill(Color.peach)
                .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
                .overlay(
                    Text("주문하기")
                        .font(.system(size: 20).weight(.medium)))
                .foregroundColor(.white)
        })
        .padding(.vertical, 8)
        .buttonStyle(ShrinkButtonStyle())
    }
    
    var confirmAlert: Alert {
        Alert(title: Text("주문 확인"),
              message: Text("\(product.name)을(를) \(quantity)개 구매하시겠습니까?"),
              primaryButton: .default(Text("확인"), action: {
                self.placeOrder()
              }),
              secondaryButton: .cancel(Text("취소")))
    }
    
    func placeOrder() {
        store.placeOrder(product: product, quantity: quantity)
        showingPopup = true
    }
    
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else {
            return text
        }
        
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
            ?? text[centerIdx...].firstIndex(of: " ")
            ?? text.index(before: text.endIndex)
        let afterSpaceIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product.productSamples[0])
    }
}
