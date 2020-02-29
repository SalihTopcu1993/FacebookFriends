//
//  ResponseItem.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 27.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation

struct ResponseItem {

    let id : String?
    let isActive: Bool?
    let picture: String?
    let age: Int?
    let eyeColor: String?
    let name: String?
    let gender: String?
    let company: String?
    let email: String?
    let phone: String?
    let address: String?
    let about: String?
    let registered: String?
    let home : Home?
    let favoriteFriends: [FavoriteFriends]?
}

extension ResponseItem : Decodable {

    enum  ResponseItemCodingKeys : String, CodingKey {
        case id = "id"
        case isActive = "isActive"
        case picture = "picture"
        case age = "age"
        case eyeColor = "eyeColor"
        case name = "name"
        case gender = "gender"
        case company = "company"
        case email = "email"
        case phone = "phone"
        case address = "address"
        case about = "about"
        case registered = "registered"
        case home = "home"
        case favoriteFriends = "favorite_friends"
        
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseItemCodingKeys.self)

        id = try? container.decode(String.self, forKey: .id)
        isActive = try? container.decode(Bool.self, forKey: .isActive)
        picture = try? container.decode(String.self, forKey: .picture)
        age = try? container.decode(Int.self, forKey: .age)
        eyeColor = try? container.decode(String.self, forKey: .eyeColor)
        name = try? container.decode(String.self, forKey: .name)
        gender = try? container.decode(String.self, forKey: .gender)
        company = try? container.decode(String.self, forKey: .company)
        email = try? container.decode(String.self, forKey: .email)
        phone = try? container.decode(String.self, forKey: .phone)
        address = try? container.decode(String.self, forKey: .address)
        about = try? container.decode(String.self, forKey: .about)
        registered = try? container.decode(String.self, forKey: .registered)
        home = try? container.decode(Home.self, forKey: .home)
        favoriteFriends = try? container.decode([FavoriteFriends].self, forKey: .favoriteFriends)
    }
    var registeredDate: String {
        let isoDate = self.registered
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        guard let date = dateFormatter.date(from:isoDate!) else { return "" }
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "HH:mm:ss"
        return myDateFormatter.string(from: date)
    }
}
