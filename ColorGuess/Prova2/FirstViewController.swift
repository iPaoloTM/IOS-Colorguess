//
//  FirstViewController.swift
//  Prova2
//
//  Created by Paolo Aliprandi on 03/11/2018.
//  Copyright © 2018 Paolo Aliprandi. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    
    
    @IBOutlet weak var Kyurem: UISwitch!
    @IBOutlet weak var IntroLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var PlayButton: UIButton!
    
    @IBAction func KyuremAttack(_ sender: UISwitch) {
        
        if (sender.isOn == false) {
        IntroLabel.textColor = .black
        IntroLabel.backgroundColor = .white
        view.backgroundColor = .white
            image.image = UIImage(named: "icon!.png")
            
        }
        else {
            IntroLabel.textColor = .white
            IntroLabel.backgroundColor = PlayButton.backgroundColor
            view.backgroundColor = .black
            image.image = UIImage(named: "icon.png")
            
        }
        
    }
    
    override func viewDidLoad() {
        
    }
    

    
}
