//
//  FavoriteFriends.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation

struct FavoriteFriends {

    let id : String?
    let name: String?
}

extension FavoriteFriends : Decodable {

    enum  FavoriteFriendsCodingKeys : String, CodingKey {
        case id = "id"
        case name = "name"
}

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FavoriteFriendsCodingKeys.self)

        id = try? container.decode(String.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
    }
}
