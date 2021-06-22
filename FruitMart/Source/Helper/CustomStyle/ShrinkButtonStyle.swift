//
//  ShrinkButtonStyle.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/21.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct ShrinkButtonStyle: ButtonStyle {
    var minScale: CGFloat = 0.9
    var minOpacity: Double = 0.6
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? minScale : 1)
            .opacity(configuration.isPressed ? minOpacity : 1)
    }
}
