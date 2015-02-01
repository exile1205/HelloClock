//
//  ClockViewController.swift
//  HelloClock
//
//  Created by soslab on 2015/1/31.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController{

    //var person:User
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var setButton: UIButton!
    @IBOutlet weak var countDownLabel: UILabel!
    
    
    var strDate:String!
    var timer:NSTimer!
    var fake = Friend(name: "Cafe Deadend", sex: "Male", birthday: "1991-12-12", image: "cafedeadend.jpg", lineID: "0800092000", habit: "Game")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasClockBefore = defaults.stringForKey("clockTime")
        if hasClockBefore == nil{
            datePicker.hidden = false
            setButton.hidden = false
            editButton.hidden = true
            dateLabel.text = "Pls edit your clock"
        }else{
            datePicker.hidden = true
            setButton.hidden = true
            editButton.hidden = false
            dateLabel.text = hasClockBefore
        }
        let currentDate = NSDate()
        datePicker.minimumDate = currentDate
        datePicker.addTarget(self, action: Selector("datePickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        countDownLabel.text = "where am i"
        var date = NSDate()
        //countDownLabel.text = stringFromDate(date)
        var dat = NSDateFormatter()
        dat.dateStyle = NSDateFormatterStyle.ShortStyle
        dat.timeStyle = NSDateFormatterStyle.ShortStyle
        
        countDownLabel.text = dat.stringFromDate(date)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(60.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func datePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        //dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        strDate = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = strDate
    }
    
    @IBAction func editAlarm(){
        datePicker.hidden = false
        editButton.hidden = true
        setButton.hidden = false
    }
    
    @IBAction func setAlarm(){
        let defaults = NSUserDefaults.standardUserDefaults()

        
        defaults.setValue(strDate, forKey: "clockTime")
        dateLabel.text = strDate
        datePicker.hidden = true
        editButton.hidden = false
        setButton.hidden = true
        
    }
    func update(){
        var date = NSDate()
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        strDate = dateFormatter.stringFromDate(date)
        
        var dat = NSDateFormatter()
        dat.dateStyle = NSDateFormatterStyle.ShortStyle
        dat.timeStyle = NSDateFormatterStyle.ShortStyle
        
        countDownLabel.text = dat.stringFromDate(date)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasClockBefore = defaults.stringForKey("clockTime")
        
        if hasClockBefore == strDate {
        //call phone api
            
        }else{
        
            println(hasClockBefore)
            println(strDate)
        }
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationController = segue.destinationViewController as RecieveCallViewController
        destinationController.unknown = fake
    }

}
