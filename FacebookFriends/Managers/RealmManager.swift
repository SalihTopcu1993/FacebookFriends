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

    
    func addResultElement(_ list:[ResponseItem], userName:String) {
        let realm = try! Realm()

        try! realm.write {
            for m in list {
                let newResult = RealmItem()
                newResult.userName = userName
                newResult.name = m.name!
                newResult.about = m.about!
                newResult.address = m.address!
                newResult.age = m.age!
                newResult.company = m.company!
                newResult.email = m.email!
                newResult.eyeColor = m.eyeColor!
                if let model = m.favoriteFriends {
                    for item in model {
                        let subitem = RealmFavoriteFriends()
                        subitem.name = item.name!
                        subitem.id = item.id!
                        newResult.favoriteFriends?.append(subitem)
                    }
                }
                newResult.gender = m.gender!
                let home = RealmHome()
                home.latitude = m.home?.latitude ?? 0.0
                home.longitude = m.home?.longitude ?? 0.0
                home.id = m.id!
                newResult.home = home
                realm.add(home)
                newResult.id = m.id!
                newResult.isActive = m.isActive!
                newResult.phone = m.phone!
                newResult.picture = m.picture!
                newResult.registered = m.registered!
                realm.add(newResult)
            }
        }
    }
    
    func readResultElement(userName:String) -> [ResponseItem] {
        
        let realm = try! Realm()
        var list:[ResponseItem] = []
        let listRealm = realm.objects(RealmItem.self).filter("userName == '\(userName)'")
        for realmItem in listRealm {
            var friendList:[FavoriteFriends] = []
            for friend in realmItem.favoriteFriends ?? [] {
                let ff = FavoriteFriends(id: friend.id, name: friend.name)
                friendList.append(ff)
            }
            
            let rHome = Home(latitude: realmItem.home?.latitude, longitude: realmItem.home?.longitude)
            
            let item = ResponseItem(id: realmItem.id, isActive: realmItem.isActive, picture: realmItem.picture, age: realmItem.age, eyeColor: realmItem.eyeColor, name: realmItem.name, gender: realmItem.gender, company: realmItem.company, email: realmItem.email, phone: realmItem.phone, address: realmItem.address, about: realmItem.about, registered: realmItem.registered, home: rHome, favoriteFriends: friendList)
            list.append(item)
        }
        
        return list
    }
}
