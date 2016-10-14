//
//  CSMyPhotoListViewController.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/14.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSMyPhotoListViewController: ViewController {
	
	var collectionView : UICollectionView!
	var flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
	
	var cellModels = [
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
		"图片",
	]
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		collectionView = UICollectionView.init(frame: CGRectZero, collectionViewLayout: flowLayout)
		self.view.addSubview(collectionView)
		collectionView.snp_makeConstraints { (make) in
			make.edges.equalTo(0)
		}
		
		flowLayout.itemSize = CGSizeMake(60, 60)
		flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
		flowLayout.minimumLineSpacing = 10
		flowLayout.minimumInteritemSpacing = 10
		
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.registerClassOf(CSMyPhotoCell)
        self.view.backgroundColor = UIColor ( red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0 )
        collectionView.contentInset = UIEdgeInsetsMake(44, 0, 49, 0)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 49, 0)
        collectionView.backgroundColor = UIColor ( red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0 )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CSMyPhotoListViewController : UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return cellModels.count * 20
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell : CSMyPhotoCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
		
		return cell
	}
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }
}

