//
//  ResultsViewController.swift
//  Quiz App
//
//  Created by admin on 5/25/20.
//  Copyright © 2020 Breanna Badalov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var noCorrect = 0
    var total = 0
    @IBOutlet weak var resultsMessageLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsMessageLabel.text = "You got \(noCorrect) out of \(total)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
