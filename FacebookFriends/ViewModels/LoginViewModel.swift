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
//            NavigationHelper.shared.FriendListVC(view: self, userName: "9nd54")
            self.delegate?.navigate(success: true)
        }else{
//            ErrorReporting.shared.showMessage(title: "Uyarı", msg: "Lütfen Geçerli Kullanıcı Adı Giriniz", on: self)
            self.delegate?.navigate(success: false)
            
        }
    }
    
}

