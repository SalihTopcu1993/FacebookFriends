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
    

    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    @IBAction func loginButton(_ sender: Any) {
    }
}

