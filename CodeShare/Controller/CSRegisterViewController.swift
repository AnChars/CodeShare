//
//  CSRegisterViewController.swift
//  CodeShare
//
//  Created by 王广威 on 2016/10/11.
//  Copyright © 2016年 forever. All rights reserved.
//

import UIKit
import Alamofire
import ReactiveCocoa
import JKCategories

class CSRegisterViewController: ViewController {

	dynamic var time = -1
	var timer : NSTimer!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = UIColor.whiteColor()
		self.title = "注册"
        // Do any additional setup after loading the view.
		
		let username = UITextField.init()
		username.font = UIFont.systemFontOfSize(15)
		username.placeholder = "输入邮箱或手机号码"
		username.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(username)
		username.snp_makeConstraints { (make) in
			make.left.right.equalTo(0)
			make.top.equalTo(100)
			make.height.equalTo(48)
		}
		
		let leftView = UIView.init()
		let leftImage = UIImageView.init(image: UIImage.init(named: "手机邮箱图标"))
		leftView.addSubview(leftImage)
		leftImage.snp_makeConstraints { (make) in
			make.center.equalTo(0)
		}
		username.leftView = leftView
		username.leftViewMode = UITextFieldViewMode.Always
		leftView.snp_makeConstraints { (make) in
			make.size.equalTo(CGSizeMake(42, 42))
		}
		
		let password = UITextField.init()
		password.font = UIFont.systemFontOfSize(15)
		password.placeholder = "输入密码"
		password.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(password)
		password.snp_makeConstraints { (make) in
			make.left.right.equalTo(0)
			make.height.equalTo(48)
			make.top.equalTo(username.snp_bottom)
		}
		
		let leftPass = UIView.init()
		let leftPassImage = UIImageView.init(image: UIImage.init(named: "密码图标"))
		password.leftView = leftPass
		password.leftViewMode = UITextFieldViewMode.Always
		leftPass.addSubview(leftPassImage)
		leftPass.snp_makeConstraints { (make) in
			make.size.equalTo(CGSizeMake(42, 42))
		}
		leftPassImage.snp_makeConstraints { (make) in
			make.center.equalTo(0)
		}
		
		let code = UITextField.init()
		code.font = UIFont.systemFontOfSize(15)
		code.placeholder = "输入验证码"
		code.backgroundColor = UIColor.whiteColor()
		self.view.addSubview(code)
		code.snp_makeConstraints { (make) in
			make.left.right.equalTo(0)
			make.top.equalTo(password.snp_bottom).offset(16)
			make.height.equalTo(48)
		}
		
		let codeLeft = UIView.init()
		let codeLeftImage = UIImageView.init(image: UIImage.init(named: "验证信息图标"))
		code.leftView = codeLeft
		code.leftViewMode = UITextFieldViewMode.Always
		codeLeft.addSubview(codeLeftImage)
		codeLeftImage.snp_makeConstraints { (make) in
			make.center.equalTo(0)
		}
		codeLeft.snp_makeConstraints { (make) in
			make.size.equalTo(CGSizeMake(42, 42))
		}
		
		let codeRight = UIView.init()
		let codeRightBtn = UIButton.init(type: UIButtonType.Custom)
		codeRightBtn.setTitle("获取验证码", forState: UIControlState.Normal)
		codeRightBtn.titleLabel?.font = UIFont.systemFontOfSize(13)
		codeRightBtn.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
		codeRightBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
		codeRightBtn.layer.borderWidth = 1.0
		// 设置视图的圆角
		codeRightBtn.layer.cornerRadius = 3.0
		// 设置让背景颜色范围在视图范围内
		codeRightBtn.layer.masksToBounds = true
		codeRightBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
		codeRightBtn.jk_setBackgroundColor(UIColor.darkGrayColor(), forState: UIControlState.Highlighted)
		codeRightBtn.jk_setBackgroundColor(UIColor.whiteColor(), forState: UIControlState.Normal)
		
		code.rightView = codeRight
		code.rightViewMode = UITextFieldViewMode.Always
		codeRight.snp_makeConstraints { (make) in
			make.height.equalTo(48)
			make.width.equalTo(120)
		}
		codeRight.addSubview(codeRightBtn)
		codeRightBtn.snp_makeConstraints { (make) in
			make.center.equalTo(0)
//			make.left.equalTo(8)
//			make.top.equalTo(4)
			make.right.equalTo(-8)
			make.top.equalTo(4)
		}
		
		username.layer.borderWidth = 1.0
		username.layer.borderColor = UIColor.lightGrayColor().CGColor
		password.secureTextEntry = true
		password.layer.borderColor = UIColor.lightGrayColor().CGColor
		password.layer.borderWidth = 1.0
		code.layer.borderWidth = 1.0
		code.layer.borderColor = UIColor.lightGrayColor().CGColor
		
		
		let registerBtn = UIButton.init(type: UIButtonType.Custom)
		registerBtn.setTitle("注册", forState: UIControlState.Normal)
		registerBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
		registerBtn.jk_setBackgroundColor(UIColor.greenColor(), forState: UIControlState.Normal)
		registerBtn.jk_setBackgroundColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
		registerBtn.jk_setBackgroundColor(UIColor ( red: 0.3175, green: 0.9413, blue: 0.6104, alpha: 1.0 ), forState: UIControlState.Disabled)
		self.view.addSubview(registerBtn)
		registerBtn.snp_makeConstraints { (make) in
			make.left.right.equalTo(0)
			make.height.equalTo(48)
			make.top.equalTo(code.snp_bottom).offset(200)
		}
		
		
		codeRightBtn.enabled = false
		registerBtn.enabled = false
		
//		username.jk_handleControlEvents(UIControlEvents.EditingChanged) { (sender) in
//			code.enabled = username.text?.lengthOfBytesUsingEncoding(NSStringEncoding.init(NSUTF8StringEncoding)) == 11
//		}
		// 用 rac 订阅输入框改变的信号，根据输入内容，改变按钮的状态
		username.rac_textSignal().subscribeNext { (sender) in
			let name = sender as! NSString
			// 两个条件决定获取验证码按钮的状态
			codeRightBtn.enabled = name.length == 11 && self.time == -1
			if name.length >= 11 {
//				password.becomeFirstResponder()
			}
		}
		
		// 将几个信号合并为一个信号，订阅并改变注册按钮的状态 (代替 delegate)
		username.rac_textSignal()
		.combineLatestWith(password.rac_textSignal())
		.combineLatestWith(code.rac_textSignal())
		.subscribeNext { (sender) in
			registerBtn.enabled =
				((username.text! as NSString).length == 11 &&
				(password.text! as NSString).length >= 6 &&
				(code.text! as NSString).length == 4)
		}
		
		// 用热信号的方式实现这个需求
//		username.rac_textSignal().toSignalProducer()
//		.combineLatestWith(password.rac_textSignal().toSignalProducer())
//		.combineLatestWith(code.rac_textSignal().toSignalProducer())
//		.startWithNext { (signal1, signal2) in
//			print("signal1:\(signal1) signal2:\(signal2)")
//			
//		}
		
		// 也可以把按钮的点击事件当做信号来订阅(代替 target Action)
		registerBtn.rac_signalForControlEvents(UIControlEvents.TouchUpInside)
		.subscribeNext { (sender) in
			print(sender as! UIButton)
		}
		
		// 将变量的改变当做信号来订阅(代替 kvo)
		// 使用 MVC 的思想，如果数据改变了，界面跟着变
		self.rac_valuesForKeyPath("time", observer: self)
		.subscribeNext { (time) in
			print(time)
			codeRightBtn.enabled = self.time == -1
			
			if self.time == -1 {
				if self.timer != nil {
					self.timer.invalidate()
				}
				codeRightBtn.setTitle("获取验证码", forState: UIControlState.Normal)
			}else {
				codeRightBtn.setTitle("还剩\(self.time)秒", forState: UIControlState.Normal)
			}
		}
//		self
		
		// 获取验证码
		codeRightBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
			self.time = 5
			
			SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethod.init(0), phoneNumber: username.text, zone: "86", customIdentifier: nil) { (error) in
//				if error != nil {
//					print(error)
					// 将 time 重新设置为 -1，如果现在符合条件，按钮依然是正常的
//					self.time = -1
				
//				}else {
					// 一开始让 time == -1 (代表现在是正常状态，按钮可用)
					// 当点击获取验证码按钮，让 time = 60，并且每秒减一
					// 当 time 减到 -1 的时候，读秒结束
					
					// 可用用监控的方式，去改变按钮的状态
					self.timer = NSTimer.jk_scheduledTimerWithTimeInterval(1.0, block: {
						self.time = self.time - 1
						}, repeats: true) as! NSTimer
					
//				}
			}
		}
		
		// 注册
//		service=User.Register&phone=18513017173&password=111111&verificationCode=1234
		registerBtn.jk_handleControlEvents(UIControlEvents.TouchUpInside) { (sender) in
//			Alamofire.request(.POST, "https://www.1000phone.tk", parameters: [
//					"service": "User.Register",
//					"phone": username.text!,
//					"password": (password.text! as NSString).jk_md5String,
//					"verificationCode": code.text!,
//				], encoding: ParameterEncoding.URLEncodedInURL, headers: nil).responseJSON(completionHandler: { (response) in
//					// 如果请求成功
//					if response.result.isSuccess {
//						print(response.result.value!)
//						
//						self.navigationController?.popViewControllerAnimated(true)
//					}else {
//						print("网络不给力，请稍后再试")
//						
//					}
//				})
			CSNetHelp.request(parameters:  [
				"service": "User.Register",
				"phone": username.text!,
				"password": (password.text! as NSString).jk_md5String,
				"verificationCode": code.text!,
				])
			.responseJSON({ (data, success) in
				if success {
					// 返回的肯定是用户数据
					self.navigationController?.popViewControllerAnimated(true)
				}else {
					// 返回的是错误原因
					UIAlertView.init(title: "有错误", message: data as? String, delegate: nil, cancelButtonTitle: "我知道了").show()
				}
			})
			
		}
		// 我们在做一些关于用户敏感信息的数据交互时，一般都要对数据进行加密
		// MD5 严格来讲，并不属于加密算法，因为 MD5 并没有解密过程，只是对数据进行提取特征加密，会破坏原数据的意义。
		// 所以一般加密密码会用MD5，这样即使服务器人员，公司内部人员，也不知道你的密码
		// 但是我们还是要尽量注册复杂一点的密码，或者为了更安全，我们会对原始的字符串进行加盐，再次MD5加密。
		// RAS、DES... 这些加密算法，可以通过秘钥解密出原始数据，所以除了密码之外的一些信息，可能会用这种加密方式
		
		// 处理键盘遮挡视图的问题 (代替通知)
		NSNotificationCenter.defaultCenter().rac_addObserverForName(UIKeyboardWillChangeFrameNotification, object: nil)
		.subscribeNext { (noti) in
			print(noti)
			// 取出通知携带的键盘的信息
			let userInfo = (noti as! NSNotification).userInfo!
			//
			let rect = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue
			print(rect.CGRectValue())
			
			// 用 SnapKit 给注册按钮做一个动画
			// 如果需要更改一个视图的约束，需要用 snp_update
			// 被 update 的约束，必须是前面已经 make 过的
			registerBtn.snp_updateConstraints(closure: { (make) in
				make.top.equalTo(code.snp_bottom).offset(50)
			})
			
			UIView.animateWithDuration(0.25, animations: {
				registerBtn.layoutIfNeeded()
			})
		}
		
		NSNotificationCenter.defaultCenter().rac_addObserverForName(UIKeyboardWillHideNotification, object: nil)
		.subscribeNext { (noti) in
			// 当键盘消失我们只需要将约束重新更新为原始状态即可
			registerBtn.snp_updateConstraints(closure: { (make) in
				make.top.equalTo(code.snp_bottom).offset(200)
			})
			
			UIView.animateWithDuration(0.25, animations: {
				registerBtn.layoutIfNeeded()
			})
		}
    }

	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.view.endEditing(true)
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
