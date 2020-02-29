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
    
//MARK: - FUNCTIONS
    func initVM(){
        viewModel.delegate = self
    }
    
//MARK: - ACTİONS
    @IBAction func loginButton(_ sender: Any) {
        if userNameTextField.text?.isEmpty ?? false {
            ErrorReporting.shared.showMessage(title: LocalizedString("Warning"), msg: LocalizedString("UserEmptyControll"), on: self)
        }else{
            viewModel.checkLogin(userName: userNameTextField.text ?? "")
        }
    }
}
//MARK: - LOGİNVC DELEGATE
extension LoginViewController: LoginDelegate {
    func navigate(success: Bool) {
        if success {
            NavigationHelper.shared.FriendListVC(view: self, userName: userNameTextField.text)
        }else {
            ErrorReporting.shared.showMessage(title: LocalizedString("Warning"), msg: LocalizedString("UserValidControll"), on: self)
        }
    }
}

