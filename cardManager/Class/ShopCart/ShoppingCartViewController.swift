//
//  ShoppingCartViewController.swift
//  cardManager
//
//  Created by style强 on 2019/3/18.
//  Copyright © 2019 style强. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    var dataArray:[CartModel] = []
    var selectArray:[CartModel] = []
    var myTableView:UITableView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        let myBottomView = CartBottomView.loadFromNib()
        myBottomView.frame = CGRect(x: 0, y: 70, width: KScreenWidth, height: 50)
        myBottomView.backgroundColor = UIColor.white
        self.view.addSubview(myBottomView)
    }
    
}
