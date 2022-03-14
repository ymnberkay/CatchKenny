//
//  ViewController.swift
//  CatchKenny
//
//  Created by Berkay Yaman on 4.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
   
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    var counter = 10
    var score = 0
    var kennyArray = [UIImageView]()
    var timer = Timer()
    var timer2 = Timer()
    var counter2 = 50
    var highscore = 0

//    let alert = UIAlertController(title: "Time's up", message: "Do you want to play again ?", preferredStyle: UIAlertController.Style.alert)
//    let okayButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.cancel, handler: nil)
//    let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
//        self().timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
//        self.timer2 = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(randomGen), userInfo: nil, repeats: true)
//
//
//    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score : \(score)"
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighscore == nil {
            highscore = 0
            highscoreLabel.text = "Highscore : \(highscore)"
        }
        if let newScore = highscore as? Int{
            highscore = newScore
            highscoreLabel.text = "Highscore : \(highscore)"
            
        }
        
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        timerLabel.text = "Timer : \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(randomGen), userInfo: nil, repeats: true)
        randomGen()
        
    }
    @objc func tappedView(){

        score += 1
        scoreLabel.text = "Score : \(score)"
    }
    @objc func timerFunc(){
        counter -= 1
        timerLabel.text = "Timer : \(counter)"
        
        if counter == 0 {
            
            timer.invalidate()
            timer2.invalidate()
            
            //Highscore
            if self.score > self.highscore {
                self.highscore = self.score
                highscoreLabel.text = "Highscore : \(self.highscore)"
                UserDefaults.standard.set(self.highscore, forKey: "highscore")
                
            
                
            }
        
        let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
                   let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                   
                   let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                       //replay function
                       
                       self.score = 0
                       self.scoreLabel.text = "Score: \(self.score)"
                       self.counter = 10
                       self.timerLabel.text = String(self.counter)
                       
                       
                       self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
                       self.timer2 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.randomGen), userInfo: nil, repeats: true)
                   }
        alert.addAction(okButton)
        alert.addAction(replayButton)
        self.present(alert, animated: false, completion: nil)
        
    }
    }
    @objc func randomGen(){
        let randomInt = Int.random(in: 1..<10)
        print(randomInt)
        for kennyArray in kennyArray {
            kennyArray.isHidden = true
        }
        if randomInt == 1 {
            kennyArray[0].isHidden = false
        }
        else if randomInt == 2{
            kennyArray[1].isHidden = false
        }
        else if randomInt == 3{
            kennyArray[2].isHidden = false
        }
        else if randomInt == 4{
            kennyArray[3].isHidden = false
        }
        else if randomInt == 5{
            kennyArray[4].isHidden = false
        }
        else if randomInt == 6{
            kennyArray[5].isHidden = false
        }
        else if randomInt == 7{
            kennyArray[6].isHidden = false
        }
        else if randomInt == 8{
            kennyArray[7].isHidden = false
        }
        else if randomInt == 9{
            kennyArray[8].isHidden = false
        }
        
        
        }

}

