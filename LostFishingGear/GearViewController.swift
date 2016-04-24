//
//  GearViewController.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/23/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class GearViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imageData: [String] = [String]()
//    var imageCounter: Int = 0

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imageData = ["cast_nets", "dredge", "falling_gear", "fishing_pole", "fyke_nets", "harpoons", "lift_net", "harpoons", "long_line", "pot_traps", "seine-net", "stow_nets", "trawl", "miscellaneous"]
    }
    
    // MARK: Collection View Delegate Methods

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return imageData.count - 1
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GearTypePhotoCell", forIndexPath: indexPath) as! GearTypeCollectionViewCell
        
        cell.backgroundColor = UIColor.blackColor()
        
        let currImage = self.imageData[indexPath.row]

        cell.imageView.image = UIImage(named: currImage)

        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
