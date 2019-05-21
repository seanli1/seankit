//
//  getDataFromAddresses.swift
//  SeanKit
//
//  Created by Sean Li on 5/21/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

/// Returns the first valid data downloaded from a list of url addresses. This is for hosting the same data at multiple addresses to avoid issues with potential website downtime.
/// If all addresses are no good (whether misspelling or no data), completion block does not run at all.
public func getDataFromAddresses(_ addresses: [String], qos: DispatchQoS.QoSClass, executeOnFirstOnly: Bool, completion: @escaping (_ address: String, _ data: Data) -> Void) {
    
    DispatchQueue.global(qos: qos).async {
        var urls = [URL]()
        for address in addresses {
            if URL(string: address) != nil {
                urls.append(URL(string: address)!)
            }
        }
        
        var foundFirstResult = false
        
        var keepLooking: Bool {
            return !foundFirstResult || !executeOnFirstOnly
        }
        
        for i in 0 ..< urls.count {
            
            DispatchQueue.global(qos: .default).async {
                let url = urls[i]
                do {
                    let data = try Data(contentsOf: url)
                    let address = url.absoluteString
                    if keepLooking {
                        completion(address, data)
                        foundFirstResult = true
                    }
                } catch {
                    if keepLooking {
                        print("Bad URL: \(url.absoluteString)")
                        print("May need to check spelling of this address.")
                    }
                }
            }
        }
    }
}
