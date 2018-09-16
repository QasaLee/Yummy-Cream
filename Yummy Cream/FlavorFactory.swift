//
//  FlavorFactory.swift
//  Yummy Cream
//
//  Created by M78 on 9/16/18.
//  Copyright © 2018 M78. All rights reserved.
//

import Foundation

class FlavorFactory {
    func flavorsFromPlist(named plistName: String, in bundle: Bundle = Bundle.main) -> [Flavor] {
        let path = bundle.path(forResource: plistName, ofType: "plist")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let options = PropertyListSerialization.MutabilityOptions()
        
        let dicArray = try! PropertyListSerialization.propertyList(from: data, options: options, format: nil) as! [[String: String]]
        return flavorsFromDictionaryArray(named: dicArray)
    }
    
    func flavorsFromDictionaryArray(named dictArray: [[String: String]]) -> [Flavor] {
        var flavors: [Flavor] = []
        for dic in dictArray {
            if let flavor = Flavor(dictionary: dic) {
                flavors.append(flavor)
            }
        }
        return flavors
    }
    
}
