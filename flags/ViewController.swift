//
//  ViewController.swift
//  flags
//
//  Created by Sathish Chinniah on 08/10/15.
//  Copyright © 2015 Sathish Chinniah. All rights reserved.
//


import GameplayKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var scoreB: UITextField!
   // @IBOutlet weak var title2: UILabel!
    
    var countries = [String]()
    var correctAnswer = 0
    var wrongAnswer = 0
    var score = 0
    var svdc : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    countries += ["Afghanistan","Anguilla", "Argentina", "Armenia","Australia", "Azerbaijan","Belarus","Bermuda","Bosnia", "Brunei", "Canada","Cayman Islands","Christmas Island","Cook Islands","Croatia","Cuba", "Dominica", "Ecuador","Ethiopia","Fiji","France", "Germany","Gibraltar","India","Ireland","Italy","Jamaica","Jordan","Kazakhstan","Kuwait","Latvia","Liberia","Lithuania","Macedonia","Malaysia","Moldova","Mongolia","Montserrat","Nauru","New_Zealand","Nigeria","Niue","North_Korea","Oman","Philippines","Qatar","Samoa","Seychelles","Slovenia","South_Georgia","Soviet_Union","Spain","Sri_Lanka","Sudan","Timor-Leste","Tonga","Tuvalu","UAE","UK","US","Uzbekistan","Zimbabwe"]
        
        
        
        button1.layer.masksToBounds = false
        button1.layer.shadowColor = UIColor(white: 0x000000, alpha: 1.0).CGColor
        button1.layer.shadowOpacity = 1.0
        button1.layer.shadowRadius = 0
        button1.layer.shadowOffset = CGSizeMake(0, 1.0)
        
        
        
        button2.layer.masksToBounds = false
        button2.layer.shadowColor = UIColor(white: 0x000000, alpha: 1.0).CGColor
        button2.layer.shadowOpacity = 1.0
        button2.layer.shadowRadius = 0
        button2.layer.shadowOffset = CGSizeMake(0, 1.0)
        
        
        
        button3.layer.masksToBounds = false
        button3.layer.shadowColor = UIColor(white: 0x000000, alpha: 1.0).CGColor
        button3.layer.shadowOpacity = 1.0
        button3.layer.shadowRadius = 0
        button3.layer.shadowOffset = CGSizeMake(0, 1.0)
        
        
        
//        
//        button1.layer.borderWidth = 0.5
//        button2.layer.borderWidth = 0.5
//        button3.layer.borderWidth = 0.5
//
//        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
//        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
//        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
//        
//        title2.layer.masksToBounds = true
//        title2.layer.cornerRadius = 8.0
//        
        askQuestion(nil)
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    
    func askQuestion(action: UIAlertAction!) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        
      self.titleL.text = countries[correctAnswer]
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        //  var svdc: String
        
        if sender.tag == correctAnswer {
            svdc = "Correct Answer"
            //score = 0
            ++score
           
            
        } else if score >= 1 {
            svdc = "Wrong Answer"
            --score
        }
        else if (score <= 0 && sender.tag == correctAnswer) {
            svdc = " Correct Nice Try"
            ++score
            
        }
        else if(score <= 0 || sender.tag == wrongAnswer) {
            
            score = 0
            svdc = "Oops ! Try Again"
           // print(" oops 0")
            
            
        }
        ////
        //        else if  (score >= 4{
        //
        //            score = 0
        //            svdc = "Great You Win! Try Again"
        //            print(" winner")
        //
        //
        //        }
        //
        //
        
        if score == 200 {
            
           // print("winner")
            svdc = "Great! You Win - play again"
            
            
            //            let ac = UIAlertController(title: "You winner", message: "play again", preferredStyle: .Alert)
            //            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: askQuestion))
            //            presentViewController(ac, animated: true, completion: nil)
            
            score = 0
            +score
            
        }
        
        let ac = UIAlertController(title: svdc, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
         scoreB.text = "\(score)"
        
        
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

