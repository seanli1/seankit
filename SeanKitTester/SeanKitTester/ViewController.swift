//
//  ViewController.swift
//  SeanKitTester
//
//  Created by Sean Li on 5/20/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import SeanKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(runTestFunction)))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor.black
        runTestFunction()
    }
}
