//
//  ViewController.swift
//  NoStoryboard
//
//  Created by Michelle Malixi on 11/14/18.
//  Copyright © 2018 Michelle Malixi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        let nameTextView = UITextView()
        nameTextView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        
        nameTextView.backgroundColor = .lightGray
        nameTextView.text = "Enter some random text here for testing Swift! This is pretty awesome!!!! These are word wrapped."
        
        self.view.addSubview(nameTextView)
        
        // use autolayout to set textview frame
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        [
            nameTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameTextView.heightAnchor.constraint(equalToConstant: 50)
            ].forEach { $0.isActive = true }
        
        nameTextView.font =
            UIFont.preferredFont(forTextStyle: .headline)
        nameTextView.delegate = self
        nameTextView.isScrollEnabled = false
        
        textViewDidChange(nameTextView)
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        //print(textView.text)
        
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}

