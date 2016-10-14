//
//  CSScrollerViewController.swift
//  CodeShare
//
//  Created by AnChar on 16/10/14.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSScrollerViewController: ViewController {

    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.whiteColor()
        
        return scrollView
    }()
    
    private(set) lazy var contenView: UIView = {
        let contenView = UIView()
        contenView.backgroundColor = UIColor ( red: 0.8781, green: 0.878, blue: 0.878, alpha: 1.0 )
        
        return contenView
    }()
    
    var contentInset = UIEdgeInsetsMake(64, 0, 0, 0){
        didSet {
            self.scrollView.contentInset = contentInset
            self.scrollView.scrollIndicatorInsets = contentInset
            self.scrollView.contentOffset = CGPointMake(0, -contentInset.top)
            /**
             更新高度
             */
            self.contenView.snp_updateConstraints { (make) in
                make.height.greaterThanOrEqualTo(view).offset(1 - contentInset.top - contentInset.bottom)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(contenView)
        /**
         *  需要在scrollView内部添加内容视图，将scrollView撑起来
         */
        self.contenView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
            make.width.equalTo(self.scrollView)
            /**
             弹性
             */
            make.height.greaterThanOrEqualTo(view).offset(1)
        }
        self.scrollView.snp_makeConstraints { (make) in
            make.edges.equalTo(0)
            make.bottom.equalTo(self.contenView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
