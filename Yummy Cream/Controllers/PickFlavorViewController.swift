//
//  ViewController.swift
//  Yummy Cream
//
//  Created by M78 on 9/16/18.
//  Copyright © 2018 M78. All rights reserved.
//

import UIKit

class PickFlavorViewController: UIViewController {
    
    // MARK: - Instance Properties
    var flavors: [Flavor] = []
    fileprivate let flavorFactory = FlavorFactory()
    
    // MARK: - IB Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var iceCreamView: IceCreamView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFlavors()
    }

    // MARK: - helper methods
    fileprivate func loadFlavors() {
        // TODO: - FIXME!
    }
    
    fileprivate func selectFirstFlavor() {
        guard let flavor = flavors.first else { return }
        
    }
    

}

// MARK: - Flavor Adapter
extension PickFlavorViewController: FlavorAdapter {
    func update(with flavor: Flavor) {
        self.iceCreamView.update(with: flavor)
        label.text = flavor.name
    }
}
