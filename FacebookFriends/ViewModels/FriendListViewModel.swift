//
//  FriendListViewModel.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation
import UIKit

protocol ListDelegate: class {
    func updatedList()
}

class FriendListViewModel {
    var result : [ResponseItem]?
    var userName: String?
    weak var delegate: ListDelegate?

    func getList() {
        if CheckInternet.Connection() {
            provider.request(.list(username:(self.userName!))) { (response) in
                switch response {
                case .failure(let err):
                    print(err)
                case .success(let value):
                    let data = value.data
                    do{
                        self.result = try JSONDecoder().decode([ResponseItem].self, from: data)
                        RealmHelper.shared.addResultElement(self.result!, userName: self.userName!)
                        self.delegate?.updatedList()
                    } catch let error {
                        print(error)
                    }
                }
            }
        }else{
            self.result = RealmHelper.shared.readResultElement(userName: userName!)
            self.delegate?.updatedList()
        }
    }
}
