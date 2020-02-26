//
//  Home.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation

struct Home {

    let latitude : Float?
    let longitude: Float?
}

extension Home : Decodable {

    enum  HomeCodingKeys : String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
}

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HomeCodingKeys.self)

        latitude = try? container.decode(Float.self, forKey: .latitude)
        longitude = try? container.decode(Float.self, forKey: .longitude)
    }
}
