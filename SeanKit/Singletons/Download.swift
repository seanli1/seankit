//
//  downloadStringFromFile.swift
//  SeanKit
//
//  Created by Sean Li on 4/16/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

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
    
}
