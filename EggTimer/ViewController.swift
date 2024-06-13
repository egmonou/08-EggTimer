//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = [ "Soft": 300, "Medium": 480, "Hard": 720]
    var timer = Timer()
    var message = "Done!"
    var totaltime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totaltime = eggTime[hardness]!
        secondsPassed = 0

        progressBar.progress = 0.0
        titleLabel.text = hardness
        titleLabel.textColor = UIColor.black

        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    
     @objc func updateCounter(){
            if secondsPassed <= totaltime {
                progressBar.progress = Float(secondsPassed) / Float(totaltime)
                secondsPassed += 1

            } else {
                timer.invalidate()
                titleLabel.text = message
                titleLabel.textColor = UIColor.red
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            }
     }
    

    
    

}
    


    

    


