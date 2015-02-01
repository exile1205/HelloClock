//
//  FriendsTableViewController.swift
//  HelloClock
//
//  Created by soslab on 2015/1/31.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends:[Friend] = [
        Friend(name: "Cafe Deadend", sex: "Male", birthday: "1991-12-12", image: "cafedeadend.jpg", lineID: "0800092000", habit: "Game"),
        Friend(name: "Homei", sex: "Male", birthday: "1966-11-12", image: "homei.jpg", lineID: "0800092000", habit: "Music"),
        Friend(name: "Teakha", sex: "Male", birthday: "1978-10-28", image: "teakha.jpg", lineID: "0812930", habit: "Play boy"),
        Friend(name: "Cafe loisl", sex: "Male", birthday: "1978-10-28", image: "cafeloisl.jpg", lineID: "0812asdas0", habit: "GGSmita"),
        Friend(name: "Petite Oyster", sex: "Female", birthday: "1992-08-28", image: "petiteoyster.jpg",  lineID: "0812asdas0", habit: "UCCU"),
        Friend(name: "For Kee Restaurant",  sex: "Female", birthday: "1981-11-08", image: "forkeerestaurant.jpg", lineID: "0812asdas0", habit: "Welcome"),
        Friend(name: "Po's Atelier",  sex: "Female", birthday: "1981-11-08", image: "posatelier.jpg", lineID: "0812asdas0", habit: "hihi")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Empty back button title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        // Self Sizing Cells
        self.tableView.estimatedRowHeight = 80.0;
        //self.tableView.rowHeight = UITableViewAutomaticDimension;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return friends.count
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as FriendsTableViewCell
        
        // Configure the cell...
        let friend = friends[indexPath.row]
        cell.nameLabel.text = friend.name
        cell.thumbnailImageView.image = UIImage(named: friend.image)
        cell.habitLabel.text = friend.habit
        
        // Circular image
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        return cell
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showFriendsDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as FriendsDetailViewController
                destinationController.friend = friends[indexPath.row]
            }
            
        }
    }


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
