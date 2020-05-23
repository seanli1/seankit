//
//  EasterEgg.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation
import AVFoundation

public class SKEasterEgg {
    
    private init() {}
    
    private static var player: AVAudioPlayer!
    private static var eggFound = false
    
     public static func play(onCompletion: @escaping () -> ()) {
        if !eggFound {
            eggFound = true
            
            var correctFramework: Bundle?
            
            for x in Bundle.allFrameworks {
                if x.bundlePath.skContains("SeanKit", caseSensitive: false) {
                    correctFramework = x
                }
            }
            
            if correctFramework == nil {
                print("Framework `SeanKit` not found.")
                return
            }
            
            guard let path = correctFramework!.path(forResource: "ring", ofType: "wav") else {
                print("'ring.wav' was not found for easter egg.")
                return
            }
            
            
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print("Error creating player with URL.")
            }
            
            var image: UIImage?
            
            if let imagePath = correctFramework!.path(forResource: "seanonthebeach", ofType: "jpeg") {
                let imageUrl = URL(fileURLWithPath: imagePath)
                do {
                    let imageData = try Data(contentsOf: imageUrl)
                    image = UIImage(data: imageData)
                } catch {
                    print("Could not convert easter egg image to data.")
                }
            } else {
                print("'seanonthebeach' picture not found.")
            }
            
            if image == nil {
                print("'seanonthebeach' image was found nil.")
                return
            }
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let resizedImage = image!.skResized(to: CGSize(width: (window.frame.height * image!.size.width) / image!.size.height, height: window.frame.height))
            let imageView = UIImageView(image: resizedImage)
            
            window.addSubview(imageView)
            imageView.frame = CGRect(x: window.frame.width, y: 0, width: (resizedImage.size.width), height: resizedImage.size.height)
            UIView.animate(withDuration: 1.25, animations: {
                imageView.center = window.center
                imageView.frame.origin.x -= 25
            }, completion: {(nil) in
                UIView.animate(withDuration: 0.7, delay: 0.7, options: .curveEaseIn, animations: {
                    imageView.frame.origin.x -= window.frame.width + imageView.frame.width
                }, completion: { (nil) in
                    imageView.removeFromSuperview()
                    eggFound = false
                    onCompletion()
                })
            })
        }
    }
    
}
