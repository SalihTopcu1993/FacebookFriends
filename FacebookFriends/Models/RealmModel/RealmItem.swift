//
//  RealmItem.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 27.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation
import RealmSwift

class RealmItem: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var isActive: Bool = false
    @objc dynamic var picture: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var eyeColor: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var company: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var about: String = ""
    @objc dynamic var registered: String = ""
    var home: RealmHome?
    var favoriteFriends:[RealmFavoriteFriends]? = []
    
    
    func ignoredProperties() -> [String] {
      return ["home", "favoriteFriends"]
    }
}

