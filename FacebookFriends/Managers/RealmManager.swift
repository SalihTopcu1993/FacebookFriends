//
//  RealmManager.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 27.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class RealmHelper: NSObject{
    
    static let shared = RealmHelper()

    
    func addResultElement(_ list:[ResponseItem]) {
        let realm = try! Realm()
        let list:[RealmItem] = []
        try! realm.write {
            for m in list {
                let newResult = RealmItem()
                newResult.name = m.name
                newResult.about = m.about
                newResult.address = m.address
                newResult.age = m.age
                newResult.company = m.company
                newResult.email = m.email
                newResult.eyeColor = m.eyeColor
                if let model = m.favoriteFriends {
                    for item in model {
                        let subitem = RealmFavoriteFriends()
                        subitem.name = item.name
                        subitem.id = item.id
                        newResult.favoriteFriends?.append(subitem)
                    }
                }
                newResult.gender = m.gender
                newResult.home?.longitude = m.home?.longitude ?? 0.0
                newResult.home?.latitude = m.home?.latitude ?? 0.0
                newResult.id = m.id
                newResult.isActive = m.isActive
                newResult.phone = m.phone
                newResult.picture = m.picture
                newResult.registered = m.registered
            }            
        }
    }
    
    func readResultElement() {
        
        let realm = try! Realm()
        var list:[ResponseItem] = []
        var friendList: [FavoriteFriends] = []
        
        guard let readResult = realm.objects(RealmList.self).first else {return}
        
        for friend in readResult.value.favoriteFriends ?? [] {
            let ff = FavoriteFriends(id: friend.id, name: friend.name)
            friendList.append(ff)
        }
        
        let rHome = Home(latitude: readResult.value.home?.latitude, longitude: readResult.value.home?.longitude)
        let item = ResponseItem(id: readResult.value.id, isActive: readResult.value.isActive, picture: readResult.value.picture, age: readResult.value.age, eyeColor: readResult.value.eyeColor, name: readResult.value.name, gender: readResult.value.gender, company: readResult.value.company, email: readResult.value.email, phone: readResult.value.phone, address: readResult.value.address, about: readResult.value.about, registered: readResult.value.registered, home: rHome, favoriteFriends: friendList)
        
        list.append(item)
        
    }
    
}
