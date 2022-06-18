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
    
    @IBOutlet weak var timeCounter: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var hours: String = "00"
    var minutes: String = "00"
    var seconds: String = "00"
    
    var counterSeconds: Int = 0
    var counterMinutes: Int = 0
    var counterHours:Int = 0
    var hourCycle: Int = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(makeStep), userInfo: nil, repeats: true)
        
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        stopButton.isEnabled = true
    }
    
    @objc func makeStep(){
        secondsAddZero()
        counterSeconds += 1
        secondLabel.text = seconds
        
        if counterSeconds > 59{
            counterSeconds = 0
            counterMinutes += 1
            minutesAddZero()
            minuteLabel.text = minutes
            if counterMinutes > 59{
                counterMinutes = 0
                counterHours += 1
                hoursAddZero()
                hourLabel.text = hours
                
                hourCycle += 1
                timeCounter.text = "\(hourCycle)"
                
                if counterHours > 59{
                    hours = "00"
                    minutes = "00"
                    seconds = "00"
                    hourCycle += 1
                    timeCounter.text = "\(hourCycle)"
                }
            }
        }
    }
    func reset(){
        hours = "00"
        minutes = "00"
        seconds = "00"
        counterSeconds = 0
        counterMinutes = 0
        counterHours = 0
        hourCycle = 0
        
        hourLabel.text = hours
        minuteLabel.text = minutes
        secondLabel.text = seconds
        timeCounter.text = "\(hourCycle)"
    }
    func secondsAddZero(){
        if counterSeconds < 10{
            seconds = "0\(counterSeconds)"
        } else{
            seconds = "\(counterSeconds)"
        }
    }
    func minutesAddZero(){
        if counterMinutes < 10{
            minutes = "0\(counterMinutes)"
        } else{
            minutes = "\(counterMinutes)"
        }
    }
    func hoursAddZero(){
        if counterHours < 10{
            hours = "0\(counterHours)"
        } else{
            hours = "\(counterHours)"
        }
    }
}
