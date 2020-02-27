//
//  FriendListCell.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import UIKit

class FriendListCell: UICollectionViewCell {
    
    var result : [ResponseItem]?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func setData(result: ResponseItem){
      nameLabel.text = result.name
      emailLabel.text = result.email
    }
}
