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

class RealmHelper{
    
    var result = [ResponseList]?.self
    
    func addResultElement() {
        let realm = try! Realm()
        
        try! realm.write {
                
        }    
    }
}
