//
//  Flavor.swift
//  Yummy Cream
//
//  Created by M78 on 9/16/18.
//  Copyright © 2018 M78. All rights reserved.
//

import UIKit

protocol FlavorAdapter {
    func update(with flavor: Flavor)
}

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
    
    // MARK: - Object Lifecycle
    init?(dictionary: [String: String]) {
        guard let name = dictionary["name"],
            let topColorString = dictionary["topColor"],
            let bottomColorString = dictionary["bottomColor"],
            let topColor = UIColor(rgbaString: topColorString),
            let bottomColor = UIColor(rgbaString: bottomColorString)
            else { return nil }
        
        // Init from things above
        self.init(name: name, topColor: topColor, bottomColor: bottomColor)
    }
    
    init(name: String, topColor: UIColor, bottomColor: UIColor) {
        self.name = name
        self.topColor = topColor
        self.bottomColor = bottomColor
    }
    
}
