//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by Oguzhan Janberk on 27/11/2019.
//  Copyright © 2019 Oguzhan Janberk. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    
    var timer = Timer()
    var isTimmerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @IBAction func resetDidTap(_ sender: Any) {

        timer.invalidate()
        isTimmerRunning = false
        counter = 0.0
        
        timerLabel.text = "0:00:00:0"
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        
    }
    
    @IBAction func pauseDidTap(_ sender: Any) {
        
        resetButton.isEnabled = true
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        
        isTimmerRunning = false
        timer.invalidate()
        
    }
    
    @IBAction func startDidTap(_ sender: Any) {
        if !isTimmerRunning{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimmerRunning = true
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
    }
    
    @objc func runTimer(){
        counter += 0.1
        //hour:min:ss
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
    
        let decisecond = String(format: "%.1f",counter).components(separatedBy: ".").last!
        
        timerLabel.text = "\(hour):\(minuteString):\(secondString).\(decisecond)"
    
}
}
