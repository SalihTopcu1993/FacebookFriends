//
//  Home.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation

struct Home {

    let latitude : Double?
    let longitude: Double?
}

extension Home : Decodable {

    enum  HomeCodingKeys : String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
}

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HomeCodingKeys.self)

        latitude = try? container.decode(Double.self, forKey: .latitude)
        longitude = try? container.decode(Double.self, forKey: .longitude)
    }
}
