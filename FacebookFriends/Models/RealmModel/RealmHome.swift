//
//  RealmHome.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 27.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHome: Object {
    
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    
}

