//
//  LoginViewController.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 25.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    let loginList = ["9nd54", "v542w", "17pcy0", "gbf48", "zdah4"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func checkLogin(){
        if loginList.contains(userNameTextField.text ?? "") {
            NavigationHelper.shared.FriendListVC(view: self, userName: "9nd54")
        }else{
            ErrorReporting.shared.showMessage(title: "Uyarı", msg: "Lütfen Geçerli Kullanıcı Adı Giriniz", on: self)
            
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        checkLogin()
    }
}

