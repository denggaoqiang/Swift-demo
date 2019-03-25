//
//  String+Extension.swift
//  cardManager
//
//  Created by style强 on 2019/3/13.
//  Copyright © 2019 style强. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func getStringSize(rectSize: CGSize,fontSize: CGFloat) -> CGSize {
        let str: NSString = self as NSString
        let rect = str.boundingRect(with: rectSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return CGSize(width: ceil(rect.width), height: ceil(rect.height))
    }
    
    func getStringSize(fontSize:CGFloat) -> CGSize{
        return self.getStringSize(rectSize: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)), fontSize: fontSize)
    }
    
    //项目中swift版本的3DES加密存在bug不建议用，仍然用OC版本的
    func three3DESEncrypt() -> String? {//加密操作
        let encrypt = JKEncrypt()
        return encrypt.do3DESEncryptStr(self)
    }
    func three3DESDeEncrypt() -> String? {//解密操作
        let encrypt = JKEncrypt()
        return encrypt.doDecEncryptStr(self)
    }
    
}
