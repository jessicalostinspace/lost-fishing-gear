//
//  LostOrFoundViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/23/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class LostOrFoundViewController: UIViewController, goBackProtocol {
    
    var lost = false
    var found = false

    @IBAction func lostButtonPressed(sender: UIButton) {
        lost = true
        performSegueWithIdentifier("gearToLocationSegue", sender: nil)
    }
    
    @IBAction func foundButtonPressed(sender: UIButton) {
        found = true
        performSegueWithIdentifier("gearToLocationSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let navController = segue.destinationViewController as! UINavigationController
        let controller = navController.topViewController as! LocationViewController
        
        controller.lost = lost
        controller.found = found
        
    }
    
    func goBack(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
