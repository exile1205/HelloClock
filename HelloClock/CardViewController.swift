//
//  CardViewController.swift
//  HelloClock
//
//  Created by soslab on 2015/2/1.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var countdownLabel:UILabel!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var sexLabel:UILabel!
    @IBOutlet weak var yesButton:UIButton!
    @IBOutlet weak var noButton:UIButton!
    var unknown:Friend!
    
    var timer = NSTimer()
    var countdown = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image.image = UIImage(named: unknown.image)
        nameLabel.text = unknown.name
        sexLabel.text = unknown.sex
        runTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func runTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:Selector("updateTimer"), userInfo: nil, repeats: true)
        
    }
    
    func updateTimer() {
        
        if --countdown < 1 {
            no()
            //timer.invalidate()
            println("down~")
        }
        
        self.updateTimerLabel();
    }
    
    
    func updateTimerLabel() {
        
        countdownLabel.text = NSString(format:"%02d:%02d", countdown/60,countdown%60)
    }
    
    @IBAction func choice(sender: AnyObject?){
        // Yes button clicked
        let buttonClicked = sender as UIButton
        
        if buttonClicked == yesButton {
            yes()
        } else if buttonClicked == noButton {
            no()
        }

    }
    func yes(){
        timer.invalidate()
        println("we're friend")
        
    }
    
    func no(){
        timer.invalidate()
        println("sorry,we're not friend")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
