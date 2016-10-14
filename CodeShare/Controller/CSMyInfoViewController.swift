//
//  CSMyInfoViewController.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/14.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSMyInfoViewController: CSScrollerViewController {

    let myTitleView = CSMyheaderView()
    var displayController = YZDisplayViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		// 封装展示多个子控制器
		self.configureViewControllers()
        self.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        self.configTitleScroll()
        self.configMyTitle()
    }
    
    func configTitleScroll(){
        
        self.displayController.setUpUnderLineEffect { (isShowUnderLine, isDelayScroll, underLineH, underLineColor) in
            isShowUnderLine.memory = true
            underLineColor.memory = UIColor ( red: 0.8225, green: 0.2924, blue: 0.0894, alpha: 1.0 )
        }
        self.displayController.setUpTitleGradient { (isShowTitleGradient, titleColorGradientStyle, startR, startG, startB, endR, endG, endB) in
            isShowTitleGradient.memory = true
            titleColorGradientStyle.memory = YZTitleColorGradientStyleFill
            startR.memory = 0.5
            startG.memory = 0.5
            startB.memory = 0.5
            endG.memory = 0.75
            endR.memory = 0.75
            endB.memory = 0.75
        }
    }
    
    
    /**
     头视图
     */
    func configMyTitle(){
        
        self.contenView.addSubview(myTitleView)
        myTitleView.snp_makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.right.equalTo(0)
            make.height.equalTo(180)
        }
        myTitleView.name="大熊猫"
        myTitleView.email="jklha@qq.com"
        myTitleView.configSubView(self,
            myShareButtonActionBlock: { (sender) in
                                    /**
                                     我的分享的执行方法
                                     */
                print("123456")
            },
        myDownButtonActionBlock: { (down) in
                                    /**
                                     *  我的下载
                                     */
                                    
            },
        myFrimeButtonActionBlock: { (frime) in
                                    /**
                                     *  我的朋友
                                     */
                                    
        }) { (set) in
            /**
             设置方法
             */
            
        }
    }
    
    
	func configureViewControllers() {
		
		let picList = CSMyPhotoListViewController()
		picList.title = "图片"
		displayController.addChildViewController(picList)
		
		let videoList = CSMyVideoListViewController()
		videoList.title = "视频"
		videoList.style = .Plain
        videoList.contentInset = UIEdgeInsetsMake(44, 0, 0, 0)
		displayController.addChildViewController(videoList)
		
		let fileList = CSMyFileListViewController()
		fileList.title = "压缩包"
		fileList.style = .Plain
        fileList.contentInset = UIEdgeInsetsMake(44, 0, 0, 0)
		displayController.addChildViewController(fileList)
		
		// 将 displayViewController 加入到本控制下，并展示
		self.addChildViewController(displayController)
		self.contenView.addSubview(displayController.view)
		// 配置控制器的大小，让子控制器的 view 大小可以根据本控制器的 view 改变而改变
//		displayController.view.frame = self.view.bounds
//		displayController.view.autoresizingMask = [
//			UIViewAutoresizing.FlexibleHeight
//			, UIViewAutoresizing.FlexibleWidth
//		]
        displayController.view.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(200)
        }
		
		displayController.view.backgroundColor = UIColor.whiteColor()
		
		// 控制器的生命周期
		displayController.didMoveToParentViewController(self)
		
//		self.navigationItem.titleView = displayController.titleScrollView
        displayController.titleScrollView.backgroundColor=UIColor ( red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9 )
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
