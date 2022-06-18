//
//  ViewController.swift
//  stopwatchHW
//
//  Created by Abai Kush on 16/6/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Labels Outlets
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var hours: String = "00"
    var minutes: String = "00"
    var seconds: String = "00"
    
    var counterSeconds = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        playButton.isEnabled = false
        
        hourLabel.text = hours
        minuteLabel.text = minutes
        secondLabel.text = seconds
    }
    
    //MARK: Stop Button Action
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop")
        timer.invalidate()
        
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        stopButton.isEnabled = false
        
        reset()
    }
    
    //MARK: Pause Button Action
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        print("Pause")
        timer.invalidate()
        
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }
    
    //MARK: Play Button Action
    @IBAction func playButtonTapped(_ sender: UIButton) {
        print("Play")
        timer = Timer.scheduledTimer(timeInterval: 0.006, target: self, selector: #selector(makeStep), userInfo: nil, repeats: true)
        
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        stopButton.isEnabled = true
    }
    
    @objc func makeStep(){
        print("Seconds: \(counterSeconds)")
        if counterSeconds < 10{
            seconds = "0\(counterSeconds)"
        } else{
            seconds = "\(counterSeconds)"
        }
        
        counterSeconds += 1
        secondLabel.text = seconds
    }
    func reset(){
        hours = "00"
        minutes = "00"
        seconds = "00"
        counterSeconds = 0
        
        hourLabel.text = hours
        minuteLabel.text = minutes
        secondLabel.text = seconds
    }
    
}

