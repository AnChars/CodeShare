//
//  CSTabBarController.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/11.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		configureViewControllers()
		
    }
	func configureViewControllers() {
		// 如果新建一个控制器，需要什么东西
		let vcInfos = [
			[
				"title": "主页",
				"image": "按钮主页",
				"class": "CodeShare.ViewController",
			],
			[
				"title": "消息",
				"image": "按钮消息",
				"class": "CodeShare.ViewController",
			],
			[
				"title": "分享",
				"image": "按钮分享",
				"class": "CodeShare.CSScrollerViewController",
			],
			[
				"title": "我的",
				"image": "按钮我的",
				"class": "CodeShare.CSMyInfoViewController",
			],
		]
		
		
		var vcArr : [UINavigationController] = []
		
		for vcInfo in vcInfos {
			// swift 中，通过字符串获取一个类，需要在类名前加上工程名，还需要将类强转一下
			let vc = (NSClassFromString(vcInfo["class"]!) as! UIViewController.Type).init()
			vc.title = vcInfo["title"]
			
			let navVC = UINavigationController.init(rootViewController: vc)
			vcArr.append(navVC)
			
		}
		self.viewControllers = vcArr
		
		var i = 0
		// 设置 tabBar 按钮图片
		for tabBarItem in self.tabBar.items! {
			tabBarItem.image = UIImage.init(named: vcInfos[i]["image"]!)
			i = i + 1
		}
		
		// 设置选中状态下 tabBar 的颜色
		self.tabBar.tintColor = UIColor ( red: 0.5089, green: 0.7681, blue: 0.1978, alpha: 1.0 )
	}
	
	override func viewDidAppear(animated: Bool) {
		// 重写控制器的生命周期方法时，最好调用父类实现
		super.viewDidAppear(animated)
		
		// 如果用户未登录，才弹出登录界面
		if CSUserModel.isLogin() == false {
			let loginVC = UINavigationController.init(rootViewController: CSLoginViewController.init())
			self.presentViewController(loginVC, animated: true, completion: nil)
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
