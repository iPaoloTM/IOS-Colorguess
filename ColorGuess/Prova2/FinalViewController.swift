//
//  FinalViewController.swift
//  Prova2
//
//  Created by Paolo Aliprandi on 17/10/2018.
//  Copyright © 2018 Paolo Aliprandi. All rights reserved.
//

import Foundation
import UIKit

class FinalViewController: UIViewController {
    
    var ScorePassed = String()
    var NumberError = String()
 
    @IBOutlet weak var FinalScore: UILabel!
    @IBOutlet weak var FinalConsole: UILabel!
    @IBOutlet weak var ErrorLabel: UITextField!
    @IBAction func restart(_ sender: Any) {
        ScorePassed = ""
    }
    
    override func viewDidLoad() {
        if Int(ScorePassed)! <= 0 {FinalScore.text = "0"} else {FinalScore.text = ScorePassed}
        
       ErrorLabel.text = NumberError
    }
    
}
