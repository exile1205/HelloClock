//
//  AddUserTableViewController.swift
//  HelloClock
//
//  Created by soslab on 2015/1/31.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import UIKit
import CoreData

class AddUserTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var habitTextField:UITextField!
    @IBOutlet weak var lineIDTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var birthdayTextField:UITextField!
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var maleButton:UIButton!
    @IBOutlet weak var femaleButton:UIButton!
    
    var user:User!
    var sex = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
        
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                imagePicker.delegate = self
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func save() {
        println( "hello man")
        // Form validation
        var errorField = ""
        
        if nameTextField.text == "" {
            errorField = "name"
        }else if self.sex == "" {
            errorField = "sex"
        }else if emailTextField.text == "" {
            errorField = "email"
        }else if passwordTextField.text == "" {
            errorField = "password"
        }
        
        if errorField != "" {
            
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed as you forget to fill in the user " + errorField + ". All fields are mandatory.", preferredStyle: .Alert)
            let doneAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(doneAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        
        // If all fields are correctly filled in, extract the field value
        // Create Friend Object and save to data store
//        if let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext {
//            
//            user = NSEntityDescription.insertNewObjectForEntityForName("User",
//                inManagedObjectContext: managedObjectContext) as User
//            user.name = nameTextField.text
//            user.nickname = nicknameTextField.text
//            user.image = UIImagePNGRepresentation(imageView.image)
//            user.lineID = lineIDTextField.text
//            user.sex = sex
//            
//            var e: NSError?
//            if managedObjectContext.save(&e) != true {
//                println("insert error: \(e!.localizedDescription)")
//                return
//            }
//        }
//      //local save
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(nameTextField.text, forKey: "UserName")
        defaults.setValue(habitTextField.text, forKey: "Habit")
        defaults.setValue(emailTextField.text, forKey: "email")
        defaults.setValue(passwordTextField.text, forKey: "password")
        defaults.setValue(lineIDTextField.text, forKey: "LineID")
        defaults.setObject(UIImagePNGRepresentation(imageView.image), forKey: "UserImage")
        defaults.setValue(sex, forKey: "UserSexsual")
        
    
    }
    
    @IBAction func updateIsVisited(sender: AnyObject) {
        // Yes button clicked
        let buttonClicked = sender as UIButton
        if buttonClicked == maleButton {
            sex = "male"
            maleButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
            femaleButton.backgroundColor = UIColor.grayColor()
        } else if buttonClicked == femaleButton {
            sex = "female"
            maleButton.backgroundColor = UIColor.grayColor()
            femaleButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        }
    }
}
