//
//  ShowAlerHelpert.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation
import UIKit

class ErrorReporting {
    
    static let shared = ErrorReporting()
    
    func showMessage(title: String, msg: String, `on` controller: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LocalizedString("OK"), style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}

