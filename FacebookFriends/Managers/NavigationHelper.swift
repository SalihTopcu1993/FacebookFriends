//
//  NavigationHelper.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation
import UIKit

class NavigationHelper: NSObject {
    
    static let shared = NavigationHelper()
    
    func FriendListVC(view: UIViewController, userName: String?) {
        if let vc = self.createVCFromStoryboard(boardName: "Main", identifier: "FriendListVC") as? FriendListVC {
            view.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func DetailVC(view: UIViewController) {
        if let vc = NavigationHelper.shared.createVCFromStoryboard(boardName: "Main", identifier: "DetailVC") as? DetailVC {
            view.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func createVCFromStoryboard(boardName: String, identifier: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: boardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier)
        return controller
    }
}
