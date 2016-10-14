//
//  CSTableViewController.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/13.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSTableViewController: ViewController {
	
	var style : UITableViewStyle = UITableViewStyle.Grouped
	
	private(set) lazy var tableView: UITableView = {
		let style = self.style
		
		let tableView = UITableView.init(frame: CGRectZero, style: style)
		tableView.showsHorizontalScrollIndicator = false
		tableView.backgroundColor = UIColor ( red: 0.801, green: 0.801, blue: 0.801, alpha: 1.0 )
		tableView.rowHeight = 64
		tableView.tableFooterView = UIView()
		tableView.delegate = self
		tableView.dataSource = self
		
		return tableView
	}()
	
	var contentInset = UIEdgeInsetsZero {
		didSet {
			// 当我们在外部自定义 contentInset 时候，我们在这里修改 tableView 的 contentInset 和指示器，防止导航条或者 tabBar 遮挡住 tableView 内容
			tableView.contentInset = contentInset
			tableView.scrollIndicatorInsets = contentInset
			
			// 设置偏移量防止已进入页面时，tableView 被挡住
			tableView.contentOffset = CGPointMake(0, -contentInset.top)
		}
	}
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.view.addSubview(tableView)
		// 设置 tableView 的约束，等于 view 的大小
		tableView.snp_makeConstraints { (make) in
			make.edges.equalTo(0)
		}
		
//		contentInset = UIEdgeInsetsMake(topBarHeight, 0, tabBarHeight, 0)
		
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

extension CSTableViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
}
