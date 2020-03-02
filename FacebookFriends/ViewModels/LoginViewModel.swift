//
//  LoginViewModel.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 29.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation

protocol LoginDelegate: class {
    func navigate(success:Bool)
}

class LoginViewModel {
    
    weak var delegate: LoginDelegate? 
    
    let loginList = ["9nd54", "v542w", "17pcy0", "gbf48", "zdah4"]
    
    func checkLogin(userName: String){
        if loginList.contains(userName) {
            self.delegate?.navigate(success: true)
        }else{
            self.delegate?.navigate(success: false)
            
        }
    }
    
}

