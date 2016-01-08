//
//  GameViewController.swift
//  Multi-Task
//
//  Created by NPappas on 12/7/15.
//  Copyright © 2015 Nick Pappas. All rights reserved.
//

import UIKit

class GameViewController: UIViewController
{
    @IBOutlet weak var commandLabel: UILabel!
    
    var currentCommand = String()
    var difficulty = Int()
    var commands = ["TAP IT", "PINCH IT", "ROTATE IT", "SWIPE IT", "HOLD IT"]
    var timer = NSTimer()
    var score = 0
    var highScore = Int()
    
    override func viewDidLoad()
    {
    
        super.viewDidLoad()
        currentCommand = "TAP IT"
        score = 0
    }
    
    @IBAction func tapped(sender: UITapGestureRecognizer)
    {
        if (currentCommand == "TAP IT")
        {
            changeCommand()
        }
    }
    
    @IBAction func pinch(sender: UIPinchGestureRecognizer)
    {
        if (currentCommand == "PINCH IT")
        {
            changeCommand()
        }
    }
    
    @IBAction func rotate(sender: UIRotationGestureRecognizer)
    {
        if (currentCommand == "ROTATE IT")
        {
            changeCommand()
        }
    }
    
    @IBAction func swipe(sender: UISwipeGestureRecognizer)
    {
        if (currentCommand == "SWIPE IT")
        {
            changeCommand()
        }
    }
    
    @IBAction func longPress(sender: AnyObject)
    {
        if (currentCommand == "HOLD IT")
        {
            changeCommand()
        }
    }
    
    func changeCommand()
    {
        score++
        timer.invalidate()
       currentCommand = commands[Int(drand48()*5)]
        commandLabel.text = currentCommand
        createTimer()
    }
    
    func createTimer()
    {
        timer = NSTimer.scheduledTimerWithTimeInterval(getDifficultyTime(), target: self, selector: Selector("presentGameOverAlert"), userInfo: nil, repeats: false)
    }
    
    func resetGame()
    {
        self.performSegueWithIdentifier("endGame", sender: self)
    }
    
    func getDifficultyTime() -> Double
    {
        switch difficulty
        {
        case 0:
            return 2.5
        case 1:
            return 1.5
        case 2:
            if currentCommand == "HOLD IT"
            {
                return 1.5
            }
            else
            {
                return 1.0
            }
        default:
            return 1.5
        }
        
    }
    
    func presentGameOverAlert()
    {
            let alert = UIAlertController(title: "Game Over", message: "Your Score: " + score.description, preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "Main Menu", style: .Default) {
                (action) -> Void in self.resetGame()
            }
            alert.addAction(alertAction)
            presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! TitleViewController
        if highScore < self.score
        {
            dvc.self.score = self.score
        }
        else
        {
            dvc.self.score = self.highScore
        }
    }
}
