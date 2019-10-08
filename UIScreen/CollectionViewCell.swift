//
//  CollectionViewCell.swift
//  UIScreen
//
//  Created by sara.galal on 10/1/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var imageNumberLabel: UILabel!
    var imageArray = ["image1.png" , "image2.png" , "image3.png" , "image4.png" ,"image5.png"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     }
    
    func configureCollectionViewCell(index: Int) {
        cellImageView.image = UIImage(named: imageArray[index])
        imageNumberLabel.text = "\(index+1)"+"\\5"
    }
    
    
    
    func viewImages(cell index: Int) {
        let vc = ImageSlider(nibName: "ImageSlider", bundle: .main)
        vc.images = imageArray
        vc.titles = imageArray
        vc.imageNumber = index
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        appDelegate.navigation?.pushViewController(vc, animated: true)
       
    }
}
