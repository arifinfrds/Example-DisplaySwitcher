//
//  Coffe.swift
//  Example DisplaySwitcher
//
//  Created by Arifin Firdaus on 6/26/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import Foundation
import UIKit

struct Coffee {
    
    var name: String
    var image: UIImage
    
    static func getCoffees() -> [Coffee] {
        return [
            Coffee(name: "Coffe A", image: #imageLiteral(resourceName: "Café_parisien")),
            Coffee(name: "Coffe B", image: #imageLiteral(resourceName: "Café_parisien")),
            Coffee(name: "Coffe C", image: #imageLiteral(resourceName: "Café_parisien")),
            Coffee(name: "Coffe D", image: #imageLiteral(resourceName: "Café_parisien")),
            Coffee(name: "Coffe E", image: #imageLiteral(resourceName: "Café_parisien")),
            Coffee(name: "Coffe F", image: #imageLiteral(resourceName: "Café_parisien")),
            Coffee(name: "Coffe G", image: #imageLiteral(resourceName: "Café_parisien"))
        ]
    }
}
