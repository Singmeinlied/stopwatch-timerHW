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
    
    @IBOutlet weak var SegmentedController: UISegmentedControl!
    @IBOutlet weak var sliderOutlet: UISlider!
    
    var hours: String = "00"
    var minutes: String = "00"
    var seconds: String = "00"
    
    var counterSeconds: Int = 0
    var counterMinutes: Int = 0
    var counterHours:Int = 0
    
    var isTimer: Bool = false
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderOutlet.isHidden = true
        
        hourLabel.text = hours
        minuteLabel.text = minutes
        secondLabel.text = seconds
    }
    
    @IBAction func segmentedTapped(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            timer.invalidate()
            reset()
            
            playStopPause(pause: false, stop: false)
            
            isTimer = false
            sliderOutlet.isHidden = true
        case 1:
            timer.invalidate()
            reset()
            
            playStopPause(pause: false, stop: false)
            
            isTimer = true
            sliderOutlet.isHidden = false
        default: print("Hello")
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        counterSeconds = Int(sender.value)
        if counterSeconds < 10{
            secondLabel.text = "0\(Int(sliderOutlet.value))"
        }else{
            secondLabel.text = "\(Int(sliderOutlet.value))"
        }
        
        
        print(counterSeconds)
    }
    
    //MARK: Stop Button Action
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop")
        playStopPause(pause: false, stop: false)
        timer.invalidate()
        reset()
    }
    
    //MARK: Pause Button Action
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        print("Pause")
        timer.invalidate()
        
        playStopPause(pause: false)
    }
    
    //MARK: Play Button Action
    @IBAction func playButtonTapped(_ sender: UIButton) {
        playStopPause(play: false)
        
        if isTimer{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeStepBack), userInfo: nil, repeats: true)
        }else{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeStep), userInfo: nil, repeats: true)
        }
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
                if counterHours > 59{
                    hours = "00"
                    minutes = "00"
                    seconds = "00"
                }
            }
        }
    }
    @objc func makeStepBack(){
        
        if counterSeconds != 0 {
            counterSeconds -= 1
            sliderOutlet.value = Float(counterSeconds)
            if counterSeconds < 10{
                secondLabel.text = "0\(counterSeconds)"
            }else{
                secondLabel.text = "\(counterSeconds)"
            }
            
        }else{
            playStopPause(pause: false, stop: false)
            timer.invalidate()
            reset()
        }
    }
    
    //MARK: reset all
    func reset(){
        counterSeconds = 0
        counterMinutes = 0
        counterHours = 0
        
        hours = "00"
        minutes = "00"
        seconds = "00"
        
        hourLabel.text = hours
        minuteLabel.text = minutes
        secondLabel.text = seconds
        
        if isTimer{
            sliderOutlet.value = 0
        }
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
    func playStopPause(play: Bool = true, pause: Bool = true, stop: Bool = true){
        playButton.isEnabled = play
        pauseButton.isEnabled = pause
        stopButton.isEnabled = stop
    }
}
