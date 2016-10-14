//
//  CSMyVideoCell.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/13.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSMyVideoCell: UITableViewCell {

	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var sizeLabel: UILabel!
	@IBOutlet weak var videoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	// 根据模型设置 cell 的界面
	func configure(withModel model: CSMyVideoModel) {
		title.text = model.title
		sizeLabel.text = model.videoSize
		
	}

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
