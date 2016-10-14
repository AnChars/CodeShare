//
//  CSUserModel.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/13.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit

class CSUserModel: NSObject {
	// 用户单例
	// 一句话写单例
	static var SharedUser = CSUserModel()
	private override init() {
		super.init()
		// 取出沙盒数据，配置默认用户
		if let userInfo = NSUserDefaults.standardUserDefaults().objectForKey(String(CSUserModel)) {
			self.yy_modelSetWithJSON(userInfo)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	var address = ""
	var avatar = ""
	var birthday = ""
	var email = ""
	var gender = ""
	var id : String? = nil
	var name = ""
	var nickname = ""
	var phone = ""
	
	// 判断用户是否登录
	class func isLogin() -> Bool {
		
		return SharedUser.id != nil
	}

	// 根据登录后获取到的用户信息，配置用户数据
	class func loggin(with userInfo: [String: AnyObject]) {
		// 用 YYModel 做字典转模型
//		SharedUser.setValuesForKeysWithDictionary(userInfo)
		SharedUser.yy_modelSetWithDictionary(userInfo)
		
		// 将用户数据存储到沙盒中
		NSUserDefaults.standardUserDefaults().setObject(SharedUser.yy_modelToJSONObject(), forKey: String(CSUserModel))
		NSUserDefaults.standardUserDefaults().synchronize()
	}
	
}
