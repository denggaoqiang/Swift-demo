//
//  CommonConstant.swift
//  cardManager
//
//  Created by style强 on 2018/11/25.
//  Copyright © 2018 style强. All rights reserved.
//

import Foundation
import UIKit

let KMAIN_SIZE = UIScreen.main.bounds
let KScreenHeight=UIScreen.main.bounds.size.height
let KScreenWidth=UIScreen.main.bounds.size.width
let topNaVHeight = (UIApplication.shared.statusBarFrame.size.height + 44.0)

/*
iPhone X ： 导航栏高度 44 、 状态栏高度 44 、tabBar高度 83
其他机型 ： 导航栏高度 44 、 状态栏高度 20 、 tabBar高度 49
*/
func tabBarHeight() ->CGFloat {
    let height = UIApplication.shared.statusBarFrame.size.height
    if  height > 20{
        return 83.0
    }else {
        return 49.0
    }
}

func availHeight()->CGFloat {
    return KScreenHeight-topNaVHeight-tabBarHeight()
}





