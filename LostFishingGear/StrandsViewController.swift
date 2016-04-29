//
//  StrandsViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/24/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class StrandsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var gearType: String?
    @IBOutlet weak var pickerView: UIPickerView!
    let numberStrands = ["0", "1", "2", "3", "4", "5", "6"]
    var numberStrandsPickerData: String = ""
    
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        goBack()
    }
    
    @IBAction func submitButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("strandsToColorSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UIPickerView Delegate functions
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberStrands.count
    }
    
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(String(numberStrands[row]))
        return String(numberStrands[row])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberStrandsPickerData = numberStrands[row]
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = numberStrands[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Futura", size: 60.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        return myTitle
    }



    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        let navController = segue.destinationViewController as! UINavigationController
        let controller = navController.topViewController as! ColorViewController
        
        controller.numberStrands = numberStrandsPickerData
    }
    
    
    func goBack(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
