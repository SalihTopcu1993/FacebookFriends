//
//  ViewModel.swift
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

class ViewModel {
    var result : [ResponseItem]?
    var userName: String?
    weak var delegate: ListDelegate?

    func getList() {
        setLoading(true)

        provider.request(.list(username:(self.userName!))) { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let value):
                let data = value.data
                do{
                    self.result = try JSONDecoder().decode([ResponseItem].self, from: data)
                    self.delegate?.updatedList()
                } catch let error {
                    print(error)
                }
                self.setLoading(false)
                
            }
        }
    }

    func setLoading (_  isLoading : Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }

}
