//
//  CommentViewController.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 25/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class CommentViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var teacher: UILabel!
    @IBOutlet var divisionLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var confirmOutlet: UIButton!
    
    var enjoyment: Int?
    var effort: Int?
    var improvement: Int?
    var division: Division
    var comment: Comment?
    var commentText: String?
    
    init(_ coder: NSCoder, _ enjoyment: Int, _ effort: Int, _ improvement: Int, _ division: Division) {
        self.enjoyment = enjoyment
        self.effort = effort
        self.improvement = improvement
        self.division = division
        super.init(coder: coder)!
    }
    
    init(_ coder: NSCoder, _ comment: String?, _ division: Division) {
        self.commentText = comment
        self.division = division
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("you must have the NSCoder thingy")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.isHidden = true
        confirmOutlet.isHidden = true
        teacher.text = division.teacher
        divisionLabel.text = division.code
        if enjoyment == nil {
            commentLabel.text = commentText ?? "does not work"
        } else {
            comment = Comment(effort: self.effort!, enjoyment: self.enjoyment!, improvement: self.improvement!)
            commentLabel.text = comment?.writeComment()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func edit(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "CommentEditViewController", creator: { coder in
            return CommentEditViewController(coder, self.commentLabel.text, self.division)
            }) else {
                fatalError("Failure to load edit view controller from storyboard")
            }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tempEdit(_ sender: Any) {
        textField.isHidden = false
        confirmOutlet.isHidden = false
        textField.text = commentLabel.text
    }
    
    @IBAction func confirm(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm", message: "Do you want to confirm", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            UIAlertAction in
            NSLog("OK Pressed")
            self.commentLabel.text = self.textField.text
            self.textField.isHidden = true
            self.confirmOutlet.isHidden = true
        }
        alertController.addAction(okAction)
        alertController.addAction(UIAlertAction(title: "Continue Editing", style: .cancel))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
