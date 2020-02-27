//
//  FriendListViewController.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 26.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ViewModel()
    var userName: String?
    var result: ResponseList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVM()
    }
    
    func initVM(){
        viewModel.userName = "9nd54"
        viewModel.delegate = self
        viewModel.getList()
    }

}

extension FriendListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.result?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendListCell", for: indexPath) as? FriendListCell {
            guard let result = viewModel.result?[indexPath.row] else { return UICollectionViewCell() }
            cell.setData(result: result)
            return cell
        }
        return UICollectionViewCell()
    }
}

extension FriendListViewController: ListDelegate {
    func updatedList() {
        collectionView.reloadData()
    }
}
