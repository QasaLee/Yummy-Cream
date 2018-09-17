//
//  ViewController.swift
//  Yummy Cream
//
//  Created by M78 on 9/16/18.
//  Copyright © 2018 M78. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

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
        
        showLoadingHUD()
        
        Alamofire.request("https://www.raywenderlich.com/downloads/Flavors.plist",
                          method: HTTPMethod.get,
                          parameters: nil,
                          encoding: PropertyListEncoding(format: PropertyListSerialization.PropertyListFormat.xml, options: 0),
                          headers: nil
            ).responsePropertyList { [weak self] (data) in
                
                guard let strongSelf = self else {
                    return
                }
                
                guard data.result.isSuccess, let dicArray = data.result.value as? [[String: String]] else {
                    return
                }
                
                strongSelf.flavors = strongSelf.flavorFactory.flavorsFromDictionaryArray(named: dicArray)
                strongSelf.collectionView.reloadData()
                strongSelf.selectFirstFlavor()
                
                strongSelf.hideLoadingHUD()
        }
    }
    
    // MARK: - Helper Methods
    fileprivate func selectFirstFlavor() {
        guard let flavor = flavors.first else { return }
        update(with: flavor)
    }
    
    fileprivate func showLoadingHUD() {
//        let hud = MBProgressHUD.showAdded(to: self.contentView, animated: true)
        let hud = MBProgressHUD.showAdded(to: self.contentView, animated: true)
        hud.label.text = "Loading!!!"
    }
    
    fileprivate func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.contentView, animated: true)
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
        cell.update(with: flavor)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PickFlavorViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let flavor = flavors[indexPath.row]
        update(with: flavor)
    }
}
