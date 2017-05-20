//
//  TodayViewController.swift
//  YesOrNo
//
//  Created by zhouchunjie on 2017/5/20.
//  Copyright © 2017年 zhouchunjie. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    var selectTwoLoadTimer : Timer!
    
    @IBOutlet weak var twoSelectLabel: UILabel!

    @IBAction func clickTwoSelectStartButton(_ sender:
        Any) {
        let randomNum = arc4random_uniform(10)
        print(randomNum)
//        Thread.sleep(forTimeInterval: 2)  // 模拟两秒的执行时间
        if(randomNum > 5){
            twoSelectLabel.textColor = UIColor.green
            twoSelectLabel.text = "Yes"
        }else{
            twoSelectLabel.textColor = UIColor.red
            twoSelectLabel.text = "No"
        }
        
    }
    
    @IBAction func clickTwoSelectResetButton(_ sender: Any) {
        resetTwoSelect()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        completionHandler(NCUpdateResult.newData)
    
    }
    
    func resetTwoSelect(){
        twoSelectLabel.textColor = UIColor.black
        twoSelectLabel.text = "YesOrNo"

    }
    
}
