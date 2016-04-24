//
//  LocationViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/23/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    var lost: Bool?
    var found: Bool?
    var delegate: goBackProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("lost: \(lost!)")
        print("found: \(found!)")
    }

    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        goBack()
    }
    
    @IBAction func latitudeTextField(sender: UITextField) {
    }
    
    @IBAction func longitudeTextField(sender: UITextField) {
    }
    
    @IBAction func submitButtonPressed(sender: UIButton) {
        
    }
    
    
    @IBAction func cityButtonPressed(sender: UIButton) {

        let alertController = UIAlertController(title: "Location", message: "Please enter city and state", preferredStyle: UIAlertControllerStyle.Alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: ({
            (_) in
            if let field = alertController.textFields![0] as? UITextField{
                ///SAVE INFO IN TEXT FIELD
            }
            
        }))
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addTextFieldWithConfigurationHandler({
            (textField) in
            
            textField.placeholder = "Ocean Shores, WA"
        })
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
    func goBack(){
        dismissViewControllerAnimated(true, completion: nil)
    }


}
