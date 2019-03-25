//
//  HomeViewController.swift
//  cardManager
//
//  Created by style强 on 2018/11/21.
//  Copyright © 2019 style强. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        weak var weakSelf = self
        self.title = "首页"
        setupSubviews()
    }
    
    fileprivate func setupSubviews() {
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitle("Push ViewController", for: .normal)
        button.sizeToFit()
        button.center = self.view.center
        button.addTarget(self, action: #selector(pushToViewController), for: .touchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    @objc func pushToViewController() {
        let pushVC = secondViewController()
        self.navigationController?.pushViewController(pushVC, animated: true)
       
    }

}
