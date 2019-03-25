//
//  GlobalFunctionTool.swift
//  cardManager
//
//  Created by style强 on 2019/3/25.
//  Copyright © 2019 style强. All rights reserved.
//

import Foundation

class GlobalFunctionTool: NSObject {
    
    /**
     网络请求传入字典返回一个字典
     */
     class func netWorkConvertDict(dictionry:[String:Any]) -> [String:Any] {
        var paraString:String = "?"
        for(key,value) in dictionry {
            paraString = "&" + "\(key)" + "\(value)"
        }
        let afterEncryptString:String? = paraString.three3DESEncrypt()
        return ["token":afterEncryptString!]
    }
    
}
