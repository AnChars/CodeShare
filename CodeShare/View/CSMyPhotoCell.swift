//
//  CSMyPhotoCell.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/14.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSMyPhotoCell: UICollectionViewCell {
    
    var mask = UIView()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		let imageView = UIImageView.init(image: UIImage.init(named: "图片"))
		self.contentView.addSubview(imageView)
		imageView.snp_makeConstraints { (make) in
			make.edges.equalTo(0)
		}
        self.contentView.addSubview(self.mask)
        self.mask.backgroundColor = UIColor ( red: 0.0353, green: 0.0355, blue: 0.0305, alpha: 0.75 )
        self.mask.alpha = 0
        mask.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
        }
	}
	
//    override var selected: Bool {
//        didSet{
//            UIView.animateWithDuration(0.25) { 
//                self.mask.alpha = CGFloat(self.selected)
//            }
//        }
//    }
    override var highlighted: Bool {
        didSet{
            UIView.animateWithDuration(0.25) {
                self.mask.alpha = CGFloat(self.highlighted)
            }
        }
    }
    
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
