//
//  CSMyFileCell.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/14.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSMyFileCell: UITableViewCell {

	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var fileSize: UILabel!
	@IBOutlet weak var from: UILabel!
	@IBOutlet weak var fileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func configureWithModel(model: CSMyFileModel) {
		title.text = model.title
		fileSize.text = model.fileSize
		from.text = model.from
		
	}

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
