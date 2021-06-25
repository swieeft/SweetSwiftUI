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
    
    func popupOverContext<Item: Identifiable, Content: View>(item: Binding<Item?>, size: CGSize? = nil, style: PopupStyle = .none, ignoringEdges edges: Edge.Set = .all, @ViewBuilder content: (Item) -> Content) -> some View {
        let isNonNil = item.wrappedValue != nil
        
        return ZStack {
            self.blur(radius: isNonNil && style == .blur ? 2 : 0)
            
            if isNonNil {
                Color.black
                    .luminanceToAlpha()
                    .popup(item: item, size: size, style: style, content: content)
                    .edgesIgnoringSafeArea(edges)
            }
        }
    }
}
