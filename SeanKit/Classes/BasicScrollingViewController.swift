//
//  BasicScrollingViewController.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation


open class BasicScrollingViewController: UIViewController {
    
    /********************************************************************************
     PROPERTIES
     ********************************************************************************/
    
    public let messageTextView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.isSelectable = false
        tv.isScrollEnabled = false
        tv.textAlignment = .center
        tv.font = UIFont.systemFont(ofSize: 18, weight: .light)
        return tv
    }()
    public let scrollView = UIScrollView()
    public let contentView = UIView()
    
    
    /********************************************************************************
     FUNCTIONS
     ********************************************************************************/
    
    public convenience init(_ title: String?, message: String?) {
        self.init()
        self.title = title
        messageTextView.text = message
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        let rightButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpSubviews()
    }
    
    
    /********************************************************************************
     SUB FUNCTIONS, CONSTRAINTS, AND HANDLERS
     ********************************************************************************/
    
    
    func setUpSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(messageTextView)
        addConstraints()
    }
    
    
    @objc func dismissVC() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            messageTextView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20),
            messageTextView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -20),
            messageTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            messageTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            ])
        
        messageTextView.sizeToFit()
        
        let views = [contentView, messageTextView, scrollView]
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}
