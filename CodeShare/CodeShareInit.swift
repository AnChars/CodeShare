//
//  CodeShareInit.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/12.
//  Copyright © 2016年 forever. All rights reserved.
//

import Foundation

// 网络请求的基地址

// 一般项目都会有一个测试地址，和正式环境的不一样，所以一般我们会根据是否是 DEBUG 模式改变 baseUrl
#if true
let QFAppBaseURL = "http://10.12.155.20/PhalApi/Public/CodeShare/"
#else
let QFAppBaseURL = "http://www.1000phone.tk/"
#endif
	
// 图片资源的基地址
let QFResourceBaseUrl = "http://www.1000phone.tk/upload/QFApi"
// 短信发送SDK的 appKey 和 appSecret
let MobApp = "142d07ce785cb"
let MobSecret = "adecbf154b1728cb450ab56c0344e988"