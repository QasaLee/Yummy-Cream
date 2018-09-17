//
//  ScoopCell.swift
//  Yummy Cream
//
//  Created by M78 on 9/16/18.
//  Copyright © 2018 M78. All rights reserved.
//

import UIKit

class ScoopCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var scoopView: ScoopView!
    @IBOutlet weak var textLabel: UILabel!
    
    // MARK: - UIView
    
}

// MARK: - FlavorAdapter
extension ScoopCell: FlavorAdapter {
    func update(with flavor: Flavor) {
        
    }
}
