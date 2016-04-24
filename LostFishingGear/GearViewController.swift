//
//  GearViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/23/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class GearViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, goBackProtocol {
    
    var imageData: [String] = [String]()
    var gearType: String = ""
    var delegate: goBackProtocol?

    @IBOutlet weak var collectionView: UICollectionView!

    @IBAction func backButtonPressed(sender: UIBarButtonItem) {
        goBack()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imageData = ["Cast Net", "Dredge", "Falling Gear", "Fishing Pole", "Fyke Net", "Lift Net", "Harpoon", "Long Line", "Pot Trap", "Seine Net", "Stow Net", "Trawl", "Miscellaneous"]
    }
    
    // MARK: Collection View Delegate Methods

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return imageData.count - 1
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GearTypePhotoCell", forIndexPath: indexPath) as! GearTypeCollectionViewCell
        
//        cell.backgroundColor = UIColor.blackColor()
        
        let currImage = self.imageData[indexPath.row]

        cell.imageView.image = UIImage(named: currImage)

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        gearType = imageData[indexPath.row]

        performSegueWithIdentifier("gearTypeToDescriptionSegue", sender: indexPath)
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navController = segue.destinationViewController as! UINavigationController
        let controller = navController.topViewController as! DescriptionViewController
        
        controller.gearType = gearType

    }
    
    func goBack(){
        dismissViewControllerAnimated(true, completion: nil)
    }


}
