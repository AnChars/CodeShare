//
//  CSHelp.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/13.
//  Copyright © 2016年 forever. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	// 封装一个可以生成随机颜色的方法
	class func randomColor() -> UIColor {
		let r = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
		let g = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
		let b = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
		
		return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
	}
}
