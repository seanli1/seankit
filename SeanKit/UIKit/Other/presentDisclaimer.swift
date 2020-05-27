//
//  presentDisclaimer.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public var skFirstTime = false
private let skDisclaimer = "skDisclaimer" // Save key

public extension UIViewController {
    
    /// Presents disclaimer in a view presented modally if disclaimer not already passed. Automatically handles checking user defaults and saving to user defaults if accepted.
    func skPresentDisclaimer(title: String?, message: String) {
        
        if let disclaimerSaved = UserDefaults.standard.value(forKey: skDisclaimer) as? Bool {
            if disclaimerSaved { return } // Only returns if there was a disclaimer saved. Otherwise, all other cases move on.
        }
        
        skFirstTime = true
        let destVC = SKDisclaimerVC()
        
        let string = "\(title ?? "")\n\n\(message)"
        let text = NSMutableAttributedString(string: string)
        text.addAttribute(.font, value: UIFont.systemFont(ofSize: 18, weight: .light), range: NSRange(location: 0, length: string.count))
        text.addAttribute(.font, value: UIFont.systemFont(ofSize: 22, weight: .medium), range: NSRange(location: 0, length: title?.count ?? 0))
        destVC.textView.attributedText = text
        destVC.modalPresentationStyle = .fullScreen
        skPresent(destVC)
    }
}



private class SKDisclaimerVC: UIViewController {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.clear
        tv.isSelectable = false
        tv.isEditable = false
        tv.isScrollEnabled = true
        return tv
    }()
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("I understand", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 1, alpha: 1)
        button.tintColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpViews()
    }
    
    
    func setUpViews() {
        view.addSubview(textView)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            textView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            textView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            textView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 40),
            button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -40)
            ])
        textView.textAlignment = .center
        
        if #available(iOS 13, *), SKDevice.style() == .dark {
            view.backgroundColor = UIColor(white: 0.2, alpha: 1)
            textView.textColor = UIColor.white
        } else {
            view.backgroundColor = UIColor.white
            textView.textColor = UIColor.darkGray
        }
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    
    @objc func buttonPressed() {
        UserDefaults.standard.set(true, forKey: skDisclaimer)
        textView.text = ""
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = UIColor(red: 0.8, green: 1, blue: 0.8, alpha: 1)
        }
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (timer) in
            self.dismiss(animated: true, completion: nil)
        }
    }
}
