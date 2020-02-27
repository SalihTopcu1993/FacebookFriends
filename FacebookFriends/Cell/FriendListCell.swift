//
//  FriendListCell.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import UIKit
import Kingfisher

class FriendListCell: UICollectionViewCell {
    
    var result : [ResponseItem]?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    func setData(result: ResponseItem){
      nameLabel.text = result.name
      emailLabel.text = result.email
      profileImageView.kf.setImage(with: URL(string: result.picture ?? ""))
    }
}
