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

extension FriendListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let result = viewModel.result?[indexPath.row] else { return }
        NavigationHelper.shared.DetailVC(view: self, result: result)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:( self.view.frame.width-40)/2, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension FriendListViewController: ListDelegate {
    func updatedList() {
        collectionView.reloadData()
    }
}
