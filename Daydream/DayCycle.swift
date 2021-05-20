//
//  DayCycle.swift
//  Daydream
//
//  Created by Anargu on 19/05/21.
//

import Foundation

class DayCycle {
    
    var _timer: Timer?
    let DAY_LENGTH : Double = 8*60*60 // seconds
    let TIMER_STEP : Double = 60 // seconds
    var runner : Double = 0 // seconds
    
    init() {
        
    }
    
    func start() {
        _timer = Timer.scheduledTimer(timeInterval: TIMER_STEP, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer(timer: Timer) {
        runner += TIMER_STEP
        print("timer fired!")
        if runner >= DAY_LENGTH {
            timer.invalidate()
        }
    }
}
