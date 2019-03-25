//
//  NibLoadableProtocol.swift
//  cardManager
//
//  Created by style强 on 2019/3/18.
//  Copyright © 2019 style强. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadableProtocol {
}
extension NibLoadableProtocol where Self : UIView {
    //在协议里面不允许定义class 只能定义static
    static func loadFromNib(_ nibname: String? = nil) -> Self {//Self (大写) 当前类对象
        //self(小写) 当前对象
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}
