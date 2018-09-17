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
        update(with: flavor)
    }
    

}

// MARK: - Flavor Adapter
extension PickFlavorViewController: FlavorAdapter {
    func update(with flavor: Flavor) {
        self.iceCreamView.update(with: flavor)
        label.text = flavor.name
    }
}


// MARK: - UICollectionViewDataSource
extension PickFlavorViewController: UICollectionViewDataSource {
    
    private struct CellIdentifier {
        static let scoop = "ScoopCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flavors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.scoop, for: indexPath) as! ScoopCell
        let flavor = flavors[indexPath.row]
//        cell.update
    }
    
    
}

