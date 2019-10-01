//
//  ViewController.swift
//  UIScreen
//
//  Created by sara.galal on 9/30/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    var cellIdentifier = "viewControllerCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.masksToBounds = false
        userImage.layer.cornerRadius = self.userImage.frame.height/2
        userImage.clipsToBounds = true
        collectionView.register(UINib(nibName:"CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @IBAction func moreInfoButton(_ sender: Any) {
        print("تابع الموضوع")
        
    }
    
}
extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CollectionViewCell {
        cell.configureCollectionViewCell(index: indexPath.row)
        return cell
        }
        fatalError()
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
              return CGSize(width: 0.9*(collectionView.frame.size.width), height: 350)
    }


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }

}
