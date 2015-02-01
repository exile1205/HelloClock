//
//  ConnectViewController.swift
//  HelloClock
//
//  Created by soslab on 2015/2/1.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var hangOutButton:UIButton!
    @IBOutlet weak var countDownLabel:UILabel!
    var unknown:Friend!
    
    var timer = NSTimer()
    var countdown = 600

    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        imageView.image = UIImage(named: unknown.image)
        countDownLabel.text = "10:00"
        // Do any additional setup after loading the view.
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
            timer.invalidate()
            countdown=0;
            hangOut()
            println("down~")
        }
        
        self.updateTimerLabel();
    }
    
    
    func updateTimerLabel() {
        
        countDownLabel.text = NSString(format:"%02d:%02d", countdown/60,countdown%60)
    }

    @IBAction func byebye(){
    
        countdown = 0
        timer.invalidate()
        hangOut()
    }
    
    func hangOut(){
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CardViewController") as CardViewController
        secondViewController.unknown = unknown
        self.presentViewController(secondViewController, animated: true, completion: nil)
        //self.navigationController.pushViewController(secondViewController, animated: true)
        //performSegueWithIdentifier("toCard", sender: self)
    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
