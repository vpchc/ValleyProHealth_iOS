//
//  MainButtonsLayout.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/7/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class MainButtonsLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .Horizontal
    }
    
    override var itemSize: CGSize {
        set {
            
        }
        get {
            let numberOfColumns: CGFloat = 3
            
            let itemWidth = CGRectGetWidth(self.collectionView!.frame) / numberOfColumns
            return CGSizeMake(itemWidth, itemWidth)
        }
    }

}
