//
//  CommentEditViewController.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 27/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class CommentEditViewController: UIViewController, UITextViewDelegate {
    
    var comment: Comment?
    var enjoyment: Int
    var effort: Int
    var improvement: Int
    
    
    init(_ coder: NSCoder, _ enjoyment: Int, _ effort: Int, _ improvement: Int) {
        self.enjoyment = enjoyment
        self.effort = effort
        self.improvement = improvement
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("you must have the NSCoder thingy")
    }
    
    let topTextView = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnotherTextView()
    }
    
    func addAnotherTextView()  {
        topTextView.delegate = self
        topTextView.text = "enter"
        topTextView.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        topTextView.font = .systemFont(ofSize: 20)
            
        view.addSubview(topTextView)
        topTextView.translatesAutoresizingMaskIntoConstraints = false
        [topTextView.topAnchor.constraint(equalTo: view!.safeAreaLayoutGuide.topAnchor),
        topTextView.leadingAnchor.constraint(equalTo: view!.leadingAnchor),
        topTextView.trailingAnchor.constraint(equalTo: view!.trailingAnchor),
        topTextView.heightAnchor.constraint(equalToConstant: 40)].forEach{
            $0.isActive = true
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
            
        if (textView.text == "Enter your notes here") {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
        
        if (textView.text == "") {
            textView.text = "Enter your notes here"
            textView.textColor = .lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if topTextView.contentSize.height >= 120.0 {
            topTextView.isScrollEnabled = true
        } else {
            let size = CGSize(width: view.frame.width, height: .infinity)
            let approxSize = textView.sizeThatFits(size)
                
            textView.constraints.forEach {(constraint) in
                    
                if constraint.firstAttribute == .height {
                        constraint.constant = approxSize.height
                }
            }
            topTextView.isScrollEnabled = false
        }
    }
}
