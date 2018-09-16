//
//  Flavor.swift
//  Yummy Cream
//
//  Created by M78 on 9/16/18.
//  Copyright © 2018 M78. All rights reserved.
//

import UIKit

struct Flavor {
    // MARK: - Static Properties
    static var chocolate: Flavor {
        return Flavor(name: "Chocolate", topColor: UIColor.RGB(203, 140, 58), bottomColor: UIColor.RGB(107, 46, 11))
    }
    static var vanilla: Flavor {
        return Flavor(name: "Vanilla", topColor: UIColor.RGB(251, 248, 236), bottomColor: UIColor.RGB(230, 215, 171))
    }
    
    // MARK: - Instance Properties
    let name: String
    let topColor: UIColor
    let bottomColor: UIColor
 
    
}
