//
//  ViewController.swift
//  FriendsTable
//
//  Created by Patrick Landin on 12/5/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var friendName = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tina = Friend()
        tina.name = "Tina Pulliam"
        var ryan = Friend()
        ryan.name = "Ryan Christensen"
        
        self.friendName = [tina, ryan]
        
        var patrick = Friend()
        patrick.name = "Patrick Landin"
        self.friendName.append(patrick)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friendName.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FRIEND_CELL", forIndexPath: indexPath) as UITableViewCell
        
        var friendToDisplay = self.friendName[indexPath.row]
        cell.textLabel.text = friendToDisplay.name
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_STUFF" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var nameToPass = self.friendName[selectedIndexPath!.row]
            detailViewController.selectedFriend = nameToPass
        }
    }

}

