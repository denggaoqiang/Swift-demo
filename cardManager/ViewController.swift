//
//  ViewController.swift
//  cardManager
//
//  Created by style强 on 2018/11/21.
//  Copyright © 2018 style强. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    private var flashArray = [flashBannerModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        netWork()
    }
    
    func netWork() {
        //这里可以显示加载框 ，也可以把加载框写在文件(NetworkManager.swift)的自定义组件（networkPlugin）中，根据个人业务自己确定
        NetWorkRequest(.flashPort, completion: { (responseData) -> (Void) in
            //结束加载框
            print(responseData)
            if responseData["code"].string == "1"{
                if let lists = responseData["data"].arrayObject {
                    self.flashArray.removeAll()
                    for item in lists {
                        let model = flashBannerModel(dict:item as! [String : AnyObject])
                        self.flashArray.append(model)
                    }
                }
            }else {
               print(String(describing: responseData["message"].string))
            }
        }) { (error) -> (Void) in
            //结束加载框
            print("网络错误")
        }
        
    }

}
