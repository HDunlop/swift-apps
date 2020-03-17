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
    
    var comment: String?
    var newComment: Comment?
    var division: Division
    
    init(_ coder: NSCoder, _ comment: String?, _ division: Division) {
        self.comment = comment
        self.division = division
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("you must have the NSCoder thingy")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.text = comment!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func confirmPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm", message: "Do you want to confirm", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            UIAlertAction in
            NSLog("OK Pressed")
            guard let vc = self.storyboard?.instantiateViewController(identifier: "CommentViewController", creator: { coder in
                return CommentViewController(coder, self.textField.text, self.division)
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
