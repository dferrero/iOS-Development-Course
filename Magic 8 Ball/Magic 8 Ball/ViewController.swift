//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Dave on 3/1/18.
//  Copyright © 2018 Suspended Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomBallNumber : Int = 0

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func askButtonPressed(_ sender: Any) {
        newBallImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newBallImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func newBallImage() {
        randomBallNumber = Int(arc4random_uniform(5))
        
        imageView.image = UIImage(named: ballArray[randomBallNumber])
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        newBallImage()
    }
    
}

