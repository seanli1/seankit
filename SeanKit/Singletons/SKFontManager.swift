//
//  FontManager.swift
//  AteBall
//
//  Created by Sean Li on 5/17/20.
//  Copyright © 2020 Sean Li. All rights reserved.
//

import UIKit


public class SKFontManager {
    
    private init() {}
    
    public static func getCustomFontNames() {
      // get each of the font families
      for family in UIFont.familyNames.sorted() {
        let names = UIFont.fontNames(forFamilyName: family)
        // print array of names
        print("Family: \(family) Font names: \(names)")
      }
    }
}
