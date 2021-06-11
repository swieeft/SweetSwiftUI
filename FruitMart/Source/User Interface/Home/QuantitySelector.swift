//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/11.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int
    var range: ClosedRange<Int> = 1...20
    
    private let softFeedback = UIImpactFeedbackGenerator(style: .soft)
    private let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    
    var body: some View {
        HStack {
            Button(action: {
                self.changeQuantity(-1)
            }, label: {
                Image(systemName: "minus.circle.fill")
                    .imageScale(.large)
                    .padding()
            })
            .foregroundColor(Color.gray.opacity(0.5))
            
            Text("\(quantity)")
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(minWidth: 40, maxWidth: 60)
            
            Button(action: {
                self.changeQuantity(1)
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .padding()
            })
            .foregroundColor(Color.gray.opacity(0.5))
        }
    }
    
    private func changeQuantity(_ num: Int) {
        if range ~= quantity + num {
            quantity += num
            softFeedback.prepare()
            softFeedback.impactOccurred(intensity: 0.8)
        } else {
            rigidFeedback.prepare()
            rigidFeedback.impactOccurred()
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        QuantitySelector(quantity: .constant(1))
    }
}
