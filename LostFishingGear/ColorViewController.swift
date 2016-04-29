//
//  ColorViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/24/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource  {

    var colorData: [String] = [String]()
    var numberStrands: String?
    var gearType: String?
    var color: String?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        goBack()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        colorData = ["Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Black", "Brown", "White", "NA"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Collection View Delegate Methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return colorData.count - 1
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ColorCell", forIndexPath: indexPath) as! ColorCollectionViewCell
        
        //        cell.backgroundColor = UIColor.blackColor()
        
        let currImage = self.colorData[indexPath.row]
        
        cell.imageView.image = UIImage(named: currImage)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        color = colorData[indexPath.row]
    performSegueWithIdentifier("ColorToWildlifeSegue", sender: indexPath)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

       // ColorToWildlifeSegue
    }
    
    
    
    func goBack(){
        dismissViewControllerAnimated(true, completion: nil)
    }


}
