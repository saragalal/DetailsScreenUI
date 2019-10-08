//
//  ContentViewController.swift
//  UIScreen
//
//  Created by sara.galal on 10/8/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController ,UIScrollViewDelegate {
   
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    var gestureRecognizer: UITapGestureRecognizer!
    //var pinchRecognizer: UIPinchGestureRecognizer!
    var pages = [Page]()
    var pageIndex: Int = 0
    var imageName: String?
    var titleText: String?
    var size: CGSize?
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(handleTap))
        gestureRecognizer.numberOfTapsRequired = 2
        imgView.addGestureRecognizer(gestureRecognizer)
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        scrollView.bounces = false
        scrollView.delegate=self
        imgView.isUserInteractionEnabled = true
        if let name = imageName {
       imgView.image = UIImage(named: name)
       size = imgView.image?.size
    }
      if let name = titleText {
         labelTitle.text = name
      }
   }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
      
    if(self.scrollView.zoomScale > self.scrollView.minimumZoomScale){
        self.scrollView.setZoomScale(self.scrollView.minimumZoomScale, animated: true)
    }
    else{
        self.scrollView.setZoomScale(self.scrollView.maximumZoomScale, animated: true)
       }
    }
    
    @IBAction func pinchHandler(_ sender: UIPinchGestureRecognizer) {
        if sender.scale > 1 {
       imgView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        }else {
            imgView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
}
