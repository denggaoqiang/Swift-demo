//
//  CustomNAVBackView.swift
//  cardManager
//
//  Created by style强 on 2019/3/19.
//  Copyright © 2019 style强. All rights reserved.
//

import UIKit

class CustomNAVBackView: UIView {
    
    //闭包，放入函数中
    var navBackBtnBlock:(()->())?
    
    let backBtn = UIButton.init(type: .custom)
    let backImage = UIImageView.init(frame: CGRect(x: -2, y: 12, width: 20, height: 20))
    let backLabel = UILabel.init(frame: CGRect(x: 21, y: 12, width: 50, height: 20))
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backBtn.frame = CGRect(x: -15, y: 0, width: 80, height: 44)
        backBtn.addTarget(self, action: #selector(clickTheBackBtn), for: .touchUpInside)
        self.addSubview(backBtn)
    
        backImage.image = UIImage.init(named: "nav_arrow_left")
        backBtn.addSubview(backImage)
        
        backLabel.text = "返回"
        backLabel.font = UIFont.systemFont(ofSize: 17)
        backLabel.textColor = UIColor.lightGray
        backBtn.addSubview(backLabel)
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func clickTheBackBtn() -> Void {
        navBackBtnBlock?()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super .hitTest(point, with: event)
        // 将点击事件在父视图的坐标转为参照按钮的坐标,这样方便确定点击是否在按钮上
        let collectPoint:CGPoint =  backBtn.convert(point, from: self)
        if backBtn.point(inside: collectPoint, with: event) {
            return backBtn
        }
        return view
    }
    
}
