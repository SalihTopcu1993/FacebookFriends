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
    
    var viewModel = ViewModel()
    var result: ResponseList?
    let loginList = ["9nd54", "v542w", "17pcy0", "gbf48", "zdah4"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func checkLogin(){
        if loginList.contains(userNameTextField.text ?? "") {
            NavigationHelper.shared.FriendListVC(view: self, userName: "salih")
        }else{
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        checkLogin()
    }
}

