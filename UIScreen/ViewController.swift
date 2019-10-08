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
         let shareButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem(rawValue: 11)!, target: self, action: #selector(menuOpen))
        shareButton.tintColor = UIColor.white
        let bookmarkButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem(rawValue: 10)!, target: self, action: #selector(menuOpen))
        bookmarkButton.tintColor = UIColor.white
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem(rawValue: 7)!, target: self, action: #selector(menuOpen))
        editButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItems = [shareButton, bookmarkButton, editButton]
//        let titleLabel = UILabel(frame: CGRect(x: (self.navigationController?.navigationBar.frame.width)! - (self.navigationController?.navigationBar.frame.width)!/4, y: 0, width: (self.navigationController?.navigationBar.frame.width)!/4, height: (self.navigationController?.navigationBar.frame.height)!))
//        titleLabel.text = "المملكة"
//        titleLabel.textColor = UIColor.hexStringToUIColor(hex: "359BFF")
//        self.navigationController?.navigationBar.addSubview(titleLabel)
    }
    
    @objc func menuOpen(button: UIButton) {
        // Handle menu button event here...
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell{
            cell.viewImages(cell: indexPath.row)
        }
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
