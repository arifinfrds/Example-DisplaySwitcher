//
//  GridCoffeeCell.swift
//  Example DisplaySwitcher
//
//  Created by Arifin Firdaus on 6/26/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

class GridCoffeeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var dataSource: Coffee? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.clipsToBounds = true
        
        // add border
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    private func updateUI() {
        guard let dataSource = dataSource else { return }
        
        self.imageView.image = dataSource.image
        self.titleLabel.text = dataSource.name
    }
    
}
