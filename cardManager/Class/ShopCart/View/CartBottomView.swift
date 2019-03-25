//
//  CartBottomView.swift
//  cardManager
//
//  Created by style强 on 2019/3/18.
//  Copyright © 2019 style强. All rights reserved.
//

import UIKit

@IBDesignable class CartBottomView: UIView,NibLoadableProtocol {
    
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var settleAccountBtn: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        selectBtn.setTitleColor(UIColor.red, for: .normal)
        settleAccountBtn.setTitleColor(UIColor.white, for: .normal)
        settleAccountBtn.backgroundColor = UIColor.colorWithHex(hex:"0xFA6621")
        settleAccountBtn.layer.cornerRadius = 20
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func clickTheSelectBtn(_ sender: UIButton) {
        
    }
    @IBAction func clickTheSettleAccountBtn(_ sender: Any) {
        
    }
    
}
