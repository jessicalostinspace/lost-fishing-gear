//
//  ColorCollectionViewCell.swift
//  LostFishingGear
//
//  Created by Jessica Wilson on 4/24/16.
//  Copyright © 2016 Jessica Wilson. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
}
