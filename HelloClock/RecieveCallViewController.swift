//
//  RecieveCallViewController.swift
//  HelloClock
//
//  Created by soslab on 2015/2/1.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import UIKit

class RecieveCallViewController: UIViewController {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var yesButton:UIButton!
    @IBOutlet weak var noButton:UIButton!
    
    var unknown:Friend!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = unknown.name
        image.image = UIImage(named: unknown.image)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destinationController = segue.destinationViewController as ConnectViewController
        destinationController.unknown = unknown
    }
    

}
