//
//  TimerViewController.swift
//  GreenScreen
//
//  Created by Manav Shah on 4/11/21.
//

import UIKit

class TimerViewController: UIViewController {
    
    
    private var isTimerRunning = false
    private var isPaused = false
    private var hours = 0
    private var minutes = 0
    private var seconds = 0
    private var secondsCount = 0
    private var timer: Timer?
    

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pauseResetButton: UIButton!
    @IBOutlet weak var startstopButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isTimerRunning = false
        isPaused = false
        
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        let duration = datePicker.countDownDuration
        seconds = 0
        hours = Int(duration/3600)
        minutes = Int(duration - Double((hours*3600)))/60
        secondsCount = ((hours * 3600) + (minutes * 60))
        timeLabel.text = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        
        if isTimerRunning == true {      // here we can add the mp3 track
            timeLabel.alpha = 0
            startstopButton.setTitle("Start", for: .normal)
            pauseResetButton.setTitle("Pause", for: .normal)
            pauseResetButton.isEnabled = false
            timer?.invalidate()
            timer = nil
        } else {
            timeLabel.alpha = 1
            startstopButton.setTitle("Reset", for: .normal)
            pauseResetButton.isEnabled = true
            if timer == nil {
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
        }
        isTimerRunning = !isTimerRunning
    }
    
    @objc func updateTimer() {
        secondsCount -= 1
        hours = secondsCount / 3600
        minutes = secondsCount / 60 - hours*60
        seconds = secondsCount - (minutes * 60) - hours*3600
        timeLabel.text = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
        if secondsCount <= 0 {
            timer!.invalidate()
            timer = nil
            timeLabel.alpha = 0
            startstopButton.setTitle("Start", for: .normal)
            pauseResetButton.isEnabled = false
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        
        if isPaused == false {
            timer?.invalidate()
            timer = nil
            pauseResetButton.setTitle("Resume", for: .normal)
            
        } else {
            if (timer != nil){
                timer?.invalidate()
                timer = nil
            }
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            pauseResetButton.setTitle("Pause", for: .normal)
            
        }
        isPaused = !isPaused
    }
}
