//
//  ViewController.swift
//  SeanKitTester
//
//  Created by Sean Li on 5/20/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit
import SeanKit

class ViewController: UIViewController {
    
    struct Sample {
        var string: String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var addresses = [String]()
        
        addresses.append("https://seanli.nyc")
        addresses.append("https://revolverlighting.com/")
        addresses.append("https://raw.githubusercontent.com/seanli1/appfiles/master/greenlist/greentasks.json")
        addresses.append("https://bitbucket.org/seanli1/appfiles/raw/master/greenlist/greentasks.json")
        addresses.append("https://raw.githubusercontent.com/seanli1/githubappfiles/master/greenlist/greentasks.json")
        addresses.append("https://bitbucket.org/seanli1/githubappfiles/raw/master/greenlist/greentasks.json")
        
        
        getDataFromAddresses(addresses, qos: .utility, executeOnFirstOnly: true) { (address, data) in
            print("RUNNING COMPLETION BLOCK")
            print(address, data)
        }
        EasterEgg.play {}
        
    }
    
    
    
}

