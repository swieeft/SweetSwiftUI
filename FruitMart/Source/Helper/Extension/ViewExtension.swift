//
//  ViewExtension.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/21.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

extension View {
    func popup<Content: View>(isPresented: Binding<Bool>, size: CGSize? = nil, style: PopupStyle = .none, @ViewBuilder content: () -> Content) -> some View {
        if isPresented.wrappedValue {
            let popup = Popup(size: size, style: style, message: content())
            let popupToggle = PopupToggle(isPresented: isPresented)
            let modifiedContent = self.modifier(popup).modifier(popupToggle)
            return AnyView(modifiedContent)
        } else {
            return AnyView(self)
        }
    }
    
    func popup<Content: View, Item: Identifiable>(item: Binding<Item?>, size: CGSize? = nil, style: PopupStyle = .none, @ViewBuilder content: (Item) -> Content) -> some View {
        if let selectedItem = item.wrappedValue {
            let content = content(selectedItem)
            let popup = Popup(size: size, style: style, message: content)
            let popupItem = PopupItem(item: item)
            let modifiedContent = self.modifier(popup).modifier(popupItem)
            return AnyView(modifiedContent)
        } else {
            return AnyView(self)
        }
    }
}
