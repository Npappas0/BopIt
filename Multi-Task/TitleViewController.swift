//
//  ViewController.swift
//  Multi-Task
//
//  Created by NPappas on 12/7/15.
//  Copyright © 2015 Nick Pappas. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController
{
    @IBOutlet weak var difficulty: UISegmentedControl!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scoreLabel.text = score.description
    }
    
    @IBAction func buttonPress(sender: AnyObject)
    {
        self.performSegueWithIdentifier("startGame", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dvc = segue.destinationViewController as! GameViewController
        dvc.self.difficulty = self.difficulty.selectedSegmentIndex
        dvc.self.highScore = self.score
    }
}

