//
//  UModel.swift
//  cardManager
//
//  Created by style强 on 2018/11/25.
//  Copyright © 2018 style强. All rights reserved.
//

import Foundation

class flashBannerModel: NSObject {
    var imgurl: String?
    var title:String?
    var turn_type: Int? = 2
    init(dict: [String: AnyObject]) {
        super.init()
        imgurl = dict["imgurl"] as? String
        title = dict["title"] as? String
        turn_type = dict["turn_type"] as? Int
    }
    
}



