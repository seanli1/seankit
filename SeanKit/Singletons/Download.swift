//
//  downloadStringFromFile.swift
//  SeanKit
//
//  Created by Sean Li on 4/16/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public typealias AddressString = String
public typealias SuccessBool = Bool

/// Singleton for convenient downloading functions in SeanKit.
public class Download {
    
    private init() {}
    
    static public func stringFromFile(_ fromURLString: String) -> String? {
        
        guard let url = URL(string: fromURLString) else {
            print("Could not get URL from the URL string. Exiting.")
            return nil
        }
        
        do {
            
            let download = try String(contentsOf: url)
            
            return download
            
        } catch {
            
            print("Could not get string from the contents of that URL. Exiting.")
            
            return nil
        }
        
    }
    
    
    static public func stringFromFile(_ fromURLString: String, completion: @escaping(String?) -> ()) {
        
        guard let url = URL(string: fromURLString) else {
            print("Could not get URL from the URL string. Exiting.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            
            if err != nil {
                print("Error received when trying to run data task. Exiting.")
                return
            }
            
            guard let data = data else {
                print("Could not get data from that URL. Exiting.")
                return
            }
            
            if let download = String(data: data, encoding: .utf8) {
                completion(download)
            }
            
            }.resume()
        
    }
    
    /// Download data from multiple addresses simultaneously.
    /**
     Example: This is good for hosting the same data at multiple addresses to avoid issues with potential website downtime.
     
     If all addresses or data are no good, **completion block does not run at all.**
     
     The data retrieval is performed on the `default` queue.
     
     - parameter addresses: An array of URL `String`s to retrieve data from.
     - parameter executeOnFirstOnly: Set to `true` to run the completion block after finding the first valid result. Set to `false` to run the completion block upon finding every valid result.
     - returns: The `address` used to obtain that particular `data` object.
     */
    static public func dataFromAddresses(_ addresses: [String], executeOnFirstOnly: Bool, completion: @escaping (_ success: SuccessBool, _ address: AddressString, _ data: Data) -> Void) {
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
        
        var errorCounter = 0
        
        for x in 0 ..< urls.count {
            
            DispatchQueue.global(qos: .utility).async {
                do {
                    let data = try Data(contentsOf: urls[x])
                    let address = urls[x].absoluteString
                    if keepLooking {
                        foundFirstResult = true
                        DispatchQueue.main.async {
                            completion(true, address, data)
                        }
                    }
                } catch {
                    if keepLooking {
                        DispatchQueue.main.async {
                            errorCounter += 1
                            print("Bad URL: \(urls[x].absoluteString)")
                            print("May need to check internet connection or spelling of this address.")
                            if errorCounter == urls.count {
                                completion(false, "", Data())
                            }
                        }
                    }
                }
            }
        }
    }
}
