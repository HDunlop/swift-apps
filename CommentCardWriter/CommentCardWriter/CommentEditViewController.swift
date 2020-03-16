//
//  CommentEditViewController.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 27/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class CommentEditViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    
    var comment: Comment?
    var newComment: Comment?
    var enjoyment: Int
    var effort: Int
    var improvement: Int
    var division: Division
    
    init(_ coder: NSCoder, _ comment: Comment?, _ enjoyment: Int, _ effort: Int, _ improvement: Int, _ division: Division) {
        self.comment = comment
        self.enjoyment = enjoyment
        self.effort = effort
        self.improvement = improvement
        self.division = division
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("you must have the NSCoder thingy")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textField.text = comment?.writeComment()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Reset", message: "Do you want to reset", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            UIAlertAction in
            NSLog("Reset Pressed")
            guard let vc = self.storyboard?.instantiateViewController(identifier: "CommentViewController", creator: { coder in
                return CommentViewController(coder, self.enjoyment, self.effort, self.improvement, self.division)
                }) else {
                    fatalError("Failure to load quiz view controller from storyboard")
                }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alertController.addAction(okAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func confirmPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm", message: "Do you want to confirm", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            UIAlertAction in
            NSLog("OK Pressed")
            guard let vc = self.storyboard?.instantiateViewController(identifier: "CommentViewController", creator: { coder in
                return CommentViewController(coder, self.enjoyment, self.effort, self.improvement, self.division)
                }) else {
                    fatalError("Failure to load quiz view controller from storyboard")
                }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        alertController.addAction(okAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
