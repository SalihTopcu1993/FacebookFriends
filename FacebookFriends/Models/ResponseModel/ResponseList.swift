//
//  ResponseList.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation

struct ResponseList {
    var value: [ResponseItem]
}

extension ResponseList : Decodable {
    enum ResponseListCodingKeys: String, CodingKey {
        case value = "value"
    }
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseListCodingKeys.self)
        value = try! container.decode([ResponseItem].self, forKey: .value)
    }
}
