//
//  BundleExtension.swift
//  FruitMart
//
//  Created by GilNam Park on 2021/06/10.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(fileName: String, as type: T.Type) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("번들에 \(fileName)이 없습니다.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("\(url)로부터 데이터를 불러올 수 없습니다.")
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("데이터 복호화에 실패했습니다.")
        }
        
        return decodedData
    }
}
