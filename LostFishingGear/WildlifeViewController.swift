//
//  WildlifeViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/25/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class WildlifeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yesButtonPressed(sender: UIButton) {
        
        let alertController = UIAlertController(title: "Wildife Description", message: "Please enter description of wildlife found", preferredStyle: UIAlertControllerStyle.Alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: ({
            (_) in
            if let field = alertController.textFields![0] as? UITextField{
                ///SAVE INFO IN TEXT FIELD
                self.performSegueWithIdentifier("wildlifeToAddInfoSegue", sender: nil)
            }
            
        }))
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addTextFieldWithConfigurationHandler({
            (textField) in
            
            textField.placeholder = "20 Dolphin Carcasses, 10 Sea Urchins"
        })
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    @IBAction func noButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("wildlifeToAddInfoSegue", sender: nil)
        
    }
    
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
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
