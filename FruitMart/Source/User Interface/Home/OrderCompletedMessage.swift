//
//  OrderCompletedMessage.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/22.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct OrderCompletedMessage: View {
    var body: some View {
        Text("주문 완료")
            .font(.system(size: 24))
            .bold()
            .kerning(2)
    }
}

struct OrderCompletedMessage_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompletedMessage()
    }
}
