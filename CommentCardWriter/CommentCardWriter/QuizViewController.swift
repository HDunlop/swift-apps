//
//  QuizViewController.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 11/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var division: Division
    var theEnjoyment: Int = 0
    var theEffort: Int = 0
    var theOpinion: Int = 0
    
    
    init(_ coder: NSCoder, division: Division) {
        self.division = division
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("you must create this controller with a division")
    }
    
    @IBOutlet var divisionOutlet: UILabel!
    @IBOutlet var enjoyment: UISegmentedControl!
    @IBOutlet var effort: UISegmentedControl!
    @IBOutlet var improvement: UISegmentedControl!
    
    override func viewDidLoad() {
        divisionOutlet.text = division.code
        theEnjoyment = enjoyment.selectedSegmentIndex
        theEffort = effort.selectedSegmentIndex
        theOpinion = improvement.selectedSegmentIndex
    }
    
    @IBAction func confirm(_ sender: Any) {
        let alertController = UIAlertController(title: "Confirm", message: "Do you want to confirm", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            UIAlertAction in
            NSLog("OK Pressed")
            guard let vc = self.storyboard?.instantiateViewController(identifier: "CommentViewController", creator: { coder in
                return CommentViewController(self.theEnjoyment, self.theEffort, self.theOpinion, self.division)
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
