//
//  DescriptionViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/23/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    var gearType: String?
    @IBOutlet weak var gearTypeLabel: UILabel!
    @IBOutlet weak var gearTypePicker: UIPickerView!
    var pickerData = [String]()
    var gearTypePickerData: String = ""
    
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        goBack()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gearTypeLabel.text = gearType!
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
        return pickerData.count
    }
    
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(String(pickerData[row]))
        return String(pickerData[row])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gearTypePickerData = pickerData[row]
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }

    func goBack(){
        dismissViewControllerAnimated(true, completion: nil)
    }
}
