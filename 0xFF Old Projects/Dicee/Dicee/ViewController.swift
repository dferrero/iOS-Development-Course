//
//  ViewController.swift
//  Dicee
//
//  Created by Dave on 15/12/17.
//  Copyright © 2017 Suspended Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomLeftDiceIndex : Int = 0
    var randomRightDiceIndex : Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDiceImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
    }
    
    func updateDiceImages() {
        
        randomLeftDiceIndex = Int(arc4random_uniform(6))
        randomRightDiceIndex = Int(arc4random_uniform(6))
        
        leftDiceImageView.image = UIImage(named: diceArray[randomLeftDiceIndex])
        rightDiceImageView.image = UIImage(named: diceArray[randomRightDiceIndex])
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        updateDiceImages()
    
    }
}

