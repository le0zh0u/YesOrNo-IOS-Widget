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
    
    var selected : Bool! = false
    @IBOutlet weak var twoSelectLabel: UILabel!

    @IBAction func clickTwoSelectStartButton(_ sender:
        Any) {
//        if let selected = selected, !selected {
            resetTwoSelect()
            DispatchQueue.main.asyncAfter(deadline:
                DispatchTime.now()
                    + Double(Int64(1*NSEC_PER_SEC))/Double(NSEC_PER_SEC)){
                        let randomNum = arc4random_uniform(10)
                        if(randomNum > 5){
                            self.twoSelectLabel.textColor = UIColor.green
                            self.twoSelectLabel.text = "Yes"
                        }else{
                            self.twoSelectLabel.textColor = UIColor.red
                            self.twoSelectLabel.text = "No"
                        }
                        self.selected = true
//            }
        }
    }
    
    @IBAction func clickTwoSelectResetButton(_ sender: Any) {
        resetTwoSelect()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        selected = false
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
        twoSelectLabel.text = "Yes Or No"
        selected = false;

    }
    
}
