//
//  ViewController.swift
//  Ninja_Gold
//
//  Created by Michael Arbogast on 5/3/16.
//  Copyright © 2016 Michael Arbogast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var buildingLabelsCollection: [UILabel]!
    
    var score = 0
    var changeInScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLabels()
        resetScore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buildingButtonPressed(sender: UIButton) {
        print(sender.tag)
        hideLabels()
        if sender.tag == 1 {
            changeInScore = Int(arc4random_uniform(10)) + 10
            score += changeInScore
            print(changeInScore, score)
        }
        else if sender.tag == 2 {
            changeInScore = Int(arc4random_uniform(5)) + 5
            score += changeInScore
            print(changeInScore, score)
        }
        else if sender.tag == 3 {
            changeInScore = Int(arc4random_uniform(3)) + 2
            score += changeInScore
            print(changeInScore, score)
        }
        else if sender.tag == 4 {
            if Int(arc4random_uniform(100)) > 50 {
                changeInScore = Int(arc4random_uniform(50))
                score += changeInScore
                print(changeInScore, score)
            }
            else {
                changeInScore = -Int(arc4random_uniform(50))
                score += changeInScore
                print(changeInScore, score)
            }
        }
        updateScore(sender)
    }
    
    func updateScore(sender: UIButton) {
        if score < 0 {
            scoreLabel.text = "You have lost."
            hideLabels()
        }
        else{
            scoreLabel.text = "Score: \(self.score)"
            buildingLabelsCollection[sender.tag - 1].hidden = false
            buildingLabelsCollection[sender.tag - 1].text = "In reward for your efforts, you have been granted \(changeInScore) gold."
            

        }
    }

    @IBAction func resetButtonPressed(sender: UIButton) {
        resetScore()
    }
    
    func resetScore() {
        score = 0
        scoreLabel.text = "Score: \(self.score)"
        hideLabels()
    }
    
    func hideLabels() {
        for eachLabel in buildingLabelsCollection {
            eachLabel.hidden = true
        }
    }
    
}

