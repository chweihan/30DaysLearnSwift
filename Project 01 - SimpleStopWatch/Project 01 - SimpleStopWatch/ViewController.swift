//
//  ViewController.swift
//  Project 01 - SimpleStopWatch
//
//  Created by 陈伟涵 on 2016/11/1.
//  Copyright © 2016年 cweihan. All rights reserved.
//


/// bug 点击set之后count变成0.0 计数在达到6之后显示出现问题


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    ///time label is start counting
    var isStart : Bool = false
    ///
    var count = 0.0
    ///
    var timer : Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func StartBtnClick(_ sender: Any) {
        if isStart {
            return
        }
        print("StartBtnClick")
        isStart = true
        startBtn.isEnabled = false
        stopBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }

    @IBAction func StopBtnClick(_ sender: Any) {
        print("StopBtnClick")
        isStart = false
        timer.invalidate()
        startBtn.isEnabled = true
        stopBtn.isEnabled = true
    }
    
    @IBAction func NavRightBtnClick(_ sender: Any) {
        print("NavRightBtnClick")
        timer.invalidate()
        isStart = false
        count = 0
        timeLabel.text = "\(count)"
        startBtn.isEnabled = true
        stopBtn.isEnabled = true
    }
    
    @objc fileprivate func updateTime() {
        count = count + 0.1
        timeLabel.text = "\(count)"
    }
}

