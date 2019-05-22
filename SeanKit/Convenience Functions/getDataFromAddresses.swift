//
//  getDataFromAddresses.swift
//  SeanKit
//
//  Created by Sean Li on 5/21/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation



/// Download data from multiple addresses simultaneously.
/**
 Example: This is good for hosting the same data at multiple addresses to avoid issues with potential website downtime.
 
 If all addresses or data are no good, **completion block does not run at all.**
 
 The data retrieval is performed on the `default` queue.
 
 - parameter addresses: An array of URL `String`s to retrieve data from.
 - parameter executeOnFirstOnly: Set to `true` to run the completion block after finding the first valid result. Set to `false` to run the completion block upon finding every valid result.
 - returns: The `address` used to obtain that particular `data` object.
 */
public func getDataFromAddresses(_ addresses: [String], executeOnFirstOnly: Bool, completion: @escaping (_ address: String, _ data: Data) -> Void) {
    
    DispatchQueue.global(qos: .default).async {
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
