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
    
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVM()
    
    }
    func initVM(){
        viewModel.delegate = self
    }
        
    @IBAction func loginButton(_ sender: Any) {
        if userNameTextField.text?.isEmpty ?? false {
            ErrorReporting.shared.showMessage(title: "Uyarı", msg: "Kullanıcı adını boş bırakmayınız", on: self)
        }else{
            viewModel.checkLogin(userName: userNameTextField.text ?? "")
        }
    }
}

extension LoginViewController: LoginDelegate {
    func navigate(success: Bool) {
        if success {
            NavigationHelper.shared.FriendListVC(view: self, userName: userNameTextField.text)
        }else {
            ErrorReporting.shared.showMessage(title: "Uyarı", msg: "Lütfen Geçerli Kullanıcı Adı Giriniz", on: self)
        }
    }
}

