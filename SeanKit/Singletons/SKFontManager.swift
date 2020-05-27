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
    
    /// Add font to bundle. Copy its filename into Info.plist in a new row called "Fonts provided by application". Then run this function and look for the new font's name in the print statement.
    public static func getCustomFontNames() {
      // get each of the font families
      for family in UIFont.familyNames.sorted() {
        let names = UIFont.fontNames(forFamilyName: family)
        // print array of names
        print("Family: \(family) Font names: \(names)")
      }
    }
}
