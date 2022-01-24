//
//  ViewController.swift
//  Prova2
//
//  Created by Paolo Aliprandi on 11/10/2018.
//  Copyright © 2018 Paolo Aliprandi. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    var seconds = 60
    var timer = Timer()
    var sas = Timer()
    var isTimerRunning = false
    var ColorNumber = 0
    var ColorButton = 0
    var Score = 0
    var Error = 0
    let PositionsArray1 = [240, 305]
    let PositionsArray2 = [401, 496]
    
//    aggiorna il timer
    @objc func updateTimer() {
        seconds.self = seconds - 1
        timerLabel.text = String(seconds)
    }
  
//    funzione timer
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        sas = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.DeathTimer)), userInfo: nil, repeats: true)
    }

    
    //permette il feedback aptico
    let notification = UINotificationFeedbackGenerator()
    
    //permette il passaggio dei dati tra i ViewController, eseguito da ErrorDisplay
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let finalViewController = segue.destination as! FinalViewController
        finalViewController.ScorePassed = score.text!;
        finalViewController.NumberError = String(Error)
    }
    
    
    //ciò che accade quando si preme il pulsante giusto
    func Correct() {
        notification.notificationOccurred(.success)
        ScoreIncrease()
        Console.textColor = .green
        Console.text = "Correct"
        seconds += 3
    }
   
//  ciò che accade quando si preme il pulsante giusto
    func notCorrect() {
        ScoreDecrease()
        notification.notificationOccurred(.error)
        Console.textColor = .red
        Console.text = "wrong"
        ErrorDisplay()
        seconds -= 5
    }
    
    //ciò che va eseguito sempre
    func Always() {
        ChangeBackgroundColor()
        ChangePosition()
        ChangeButton()
    }
    
    //cambia la posizione dei pulsanti
    func ChangePosition() {
        let RY = PositionsArray1.randomElement()
        let PY = PositionsArray2.randomElement()
        let BY = PositionsArray1.randomElement()
        let GY = PositionsArray2.randomElement()
        
        RedButtonName.frame.origin = CGPoint(x: 16, y: RY!)
        BlueButtonName.frame.origin = CGPoint(x: 211, y: BY!)
        GreenButtonName.frame.origin = CGPoint(x: 16, y: GY!)
        PurpleButtonName.frame.origin = CGPoint(x: 211, y: PY!)
        
    }
    
    //cambia il colore delle scritte dei pulsanti
    func ChangeButton() {
        ColorButton.self = Int.random(in: 0 ..< 4)
        switch ColorButton {
            case 0:
            RedButtonName.setTitleColor(.red, for: .normal)
            case 1:
            RedButtonName.setTitleColor(.blue, for: .normal)
            case 2:
            RedButtonName.setTitleColor(.green, for: .normal)
            case 3:
           RedButtonName.setTitleColor(.purple, for: .normal)
            default:
            print("no lel")
        }
        ColorButton.self = Int.random(in: 0 ..< 4)
        switch ColorButton {
        case 0:
            BlueButtonName.setTitleColor(.blue, for: .normal)
        case 1:
            BlueButtonName.setTitleColor(.red, for: .normal)
        case 2:
            BlueButtonName.setTitleColor(.purple, for: .normal)
        case 3:
            BlueButtonName.setTitleColor(.green, for: .normal)
        default:
            print("no lel")
        }
        ColorButton.self = Int.random(in: 0 ..< 4)
        switch ColorButton {
        case 0:
            PurpleButtonName.setTitleColor(.green, for: .normal)
        case 1:
            PurpleButtonName.setTitleColor(.purple, for: .normal)
        case 2:
            PurpleButtonName.setTitleColor(.red, for: .normal)
        case 3:
            PurpleButtonName.setTitleColor(.blue, for: .normal)
        default:
            print("no lel")
        }
        ColorButton.self = Int.random(in: 0 ..< 4)
        switch ColorButton {
        case 0:
            GreenButtonName.setTitleColor(.green, for: .normal)
        case 1:
            GreenButtonName.setTitleColor(.blue, for: .normal)
        case 2:
            GreenButtonName.setTitleColor(.purple, for: .normal)
        case 3:
            GreenButtonName.setTitleColor(.red, for: .normal)
        default:
            print("no lel")
        }
    }
    
    //cambia lo sfondo
    func ChangeBackgroundColor() {
         ColorNumber.self = Int.random(in: 0 ..< 4)
        switch ColorNumber {
        case 0:
            view.backgroundColor = .red
            //DebugColorText.text = "Red"
        case 1:
            view.backgroundColor = .blue
            //DebugColorText.text = "blue"
        case 2:
            view.backgroundColor = .green
            //DebugColorText.text = "green"
        case 3:
            view.backgroundColor = .purple
           // DebugColorText.text = "Yellow"
        default:
            print("no lel")
        }
    }
    
    func ScoreIncrease() {
        Score.self = Score + 1
        score.text = String(Score)
    }
    
    func ScoreDecrease() {
        Score.self = Score - 1
        score.text = String(Score)
    }
    
    func EndMatch() {
        show((storyboard?.instantiateViewController(withIdentifier: "FinalViewController"))!, sender: self);
        //mostra la schermata finale
    }
    
    //mostra gli errori e quando sono 3 termina la partita
    func ErrorDisplay() {
        Error.self = Error + 1
        ErrorLabel.text?.append("❌")
        /*if Error == 1 { ErrorLabel.text = "❌" }
    else if Error == 2 {ErrorLabel.text = "❌❌"}
    else if Error == 3 {ErrorLabel.text = "❌❌❌";
         performSegue(withIdentifier: "segue", sender: self);
//            passa il dato "Score" alla schermata finale
            EndMatch()
            
        }*/
    }
    
//    finito il tempo, finisce partita
    @objc func DeathTimer() {
        
        if seconds <= 10 {timerLabel.textColor = .red; timerLabel.font = timerLabel.font.withSize(30)} else {}
        if seconds <= 0  {
            //passa il dato "Score" alla schermata finale
            performSegue(withIdentifier: "segue", sender: self);
            EndMatch()
            }
        else {}
    }
    

    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var ErrorLabel: UITextField!
    @IBOutlet weak var score: UITextField!
    @IBOutlet weak var Console: UITextField!
    @IBOutlet weak var RedButtonName: UIButton!
    @IBOutlet weak var PurpleButtonName: UIButton!
    @IBOutlet weak var GreenButtonName: UIButton!
    @IBOutlet weak var BlueButtonName: UIButton!
    @IBAction func RedButton(_ sender: Any) {
        //impact.impactOccurred()
        
        if ColorNumber == 0 {
            Correct()
            
        } else {
            notCorrect()
        }
        Always()
    }
    @IBAction func PurpleButton(_ sender: Any) {
        //impact.impactOccurred()
        if ColorNumber == 3 {
            Correct()
        } else {
          notCorrect()
        }
        Always()
    }
    
    @IBAction func GreenButton(_ sender: Any) {
        //impact.impactOccurred()
        
        
        if ColorNumber == 2 {
           Correct()
        } else {
           notCorrect()
        }
        Always()
    }
    
    @IBAction func BlueButton(_ sender: Any) {
        //impact.impactOccurred()
        
        if ColorNumber == 1 {
           Correct()
        } else {
            notCorrect()
        }
        Always()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChangeBackgroundColor()
        ChangeButton()
        runTimer()
}
}

