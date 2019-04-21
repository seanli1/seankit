//
//  EasterEgg.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation
import AVFoundation

public class EasterEgg {
    
    private init() {}
    
    private static var player: AVAudioPlayer!
    private static var eggFound = false
    
    
     public static func play(onCompletion: @escaping () -> ()) {
        if !eggFound {
            eggFound = true
            guard let path = Bundle.main.path(forResource: "ring", ofType: "wav") else {
                print("'ring.wav' was not found for easter egg.")
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print("Error creating player with URL")
            }
            let image = UIImage(named: "seanonthebeach")
            if image == nil {
                print("Must add picture 'seanonthebeach' to Assets.cxassets folder for easter egg.")
                return
            }
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let resizedImage = image!.resized(to: CGSize(width: (window.frame.height * image!.size.width) / image!.size.height, height: window.frame.height))
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
