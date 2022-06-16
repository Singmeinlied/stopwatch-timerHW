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
    
    var hours: String = "00"
    var minutes: String = "00"
    var seconds: String = "00"
    
    var counter = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.isEnabled = false
        
        hourLabel.text = hours
        minuteLabel.text = minutes
        secondLabel.text = seconds
    }
    
    //MARK: Stop Button Action
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop")
        timer.invalidate()
        
        playButton.isEnabled = true
    }
    
    //MARK: Pause Button Action
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        print("Pause")
        timer.invalidate()
        playButton.isEnabled = false
    }
    
    //MARK: Play Button Action
    @IBAction func playButtonTapped(_ sender: UIButton) {
        print("Play")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeStep), userInfo: nil, repeats: true)
    }
    
    @objc func makeStep(){
        print("Seconds: \(counter)")
        if counter < 10{
            seconds = "0\(counter)"
        } else{
            seconds = "\(counter)"
        }
        
        counter += 1
        secondLabel.text = seconds
    }
}

