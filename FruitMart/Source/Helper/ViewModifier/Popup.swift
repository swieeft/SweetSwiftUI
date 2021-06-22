//
//  Popup.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/21.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

enum PopupStyle {
    case none
    case blur
    case dimmed
}

struct Popup<Message: View>: ViewModifier {
    let size: CGSize?
    let style: PopupStyle
    let message: Message
    
    init(size: CGSize? = nil, style: PopupStyle = .none, message: Message) {
        self.size = size
        self.style = style
        self.message = message
    }
    
    func body(content: Content) -> some View {
        content
            .blur(radius: style == .blur ? 2 : 0)
            .overlay(Rectangle().fill(Color.black.opacity(style == .dimmed ? 0.4 : 0)), alignment: .center)
            .overlay(popupContent, alignment: .center)
    }
    
    private var popupContent: some View {
        GeometryReader {
            let width = self.size?.width ?? $0.size.width * 0.6
            let height = self.size?.height ?? $0.size.height * 0.25
            
            let x = ($0.size.width / 2) - (width / 2)
            let y = ($0.size.height / 2) - (height / 2)
            
            VStack {
                self.message
            }
            .frame(width: width, height: height)
            .background(Color.primary.colorInvert())
            .cornerRadius(12)
            .shadow(color: .primaryShadow, radius: 15, x: 5, y: 5)
            .overlay(self.checkCircleMark, alignment: .top)
            .offset(x: x, y: y)
        }
    }
    
    private var checkCircleMark: some View {
        Symbol("checkmark.circle.fill", color: .peach)
            .font(Font.system(size: 60).weight(.semibold))
//            .background(Color.white.scaleEffect(0.8))
            .offset(x: 0, y: -20)
    }
}


struct PopupToggle: ViewModifier {
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .disabled(isPresented)
            .onTapGesture {
                self.isPresented.toggle()
            }
    }
}

struct PopupItem<Item: Identifiable>: ViewModifier {
    @Binding var item: Item?
    
    func body(content: Content) -> some View {
        content
            .disabled(item != nil)
            .onTapGesture {
                self.item = nil
            }
    }
}
