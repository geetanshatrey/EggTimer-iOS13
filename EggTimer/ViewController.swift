//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    let eggTimes = ["Soft" : 3 , "Medium" : 4 , "Hard" : 7]
    
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    

    @objc func update() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentageProgress
        }
        else {
            player.play()
            timer.invalidate()
            titleLabel.text = "Done !"
        }
        
    }
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        player = try! AVAudioPlayer(contentsOf: url!)
        player.stop()
        timer.invalidate()
        totalTime = eggTimes[sender.currentTitle!]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = sender.currentTitle!
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
}
