//
//  CoffeeViewController.swift
//  Example DisplaySwitcher
//
//  Created by Arifin Firdaus on 6/26/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import DisplaySwitcher

class CoffeeViewController: UIViewController {
    
    
    // MARK: - Injections
    
    let coffees = Coffee.getCoffees()
    
    private lazy var listLayout = DisplaySwitchLayout(staticCellHeight: 180, nextLayoutStaticCellHeight: 180, layoutState: .list)
    
    private lazy var gridLayout = DisplaySwitchLayout(staticCellHeight: 180, nextLayoutStaticCellHeight: 180, layoutState: .grid)
    
    private var layoutState: LayoutState = .grid
    
    // MARK: - Properties
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var rotationButton: UIBarButtonItem!
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
        setupCollectionView()
        setupNavBar()
    }
    
    
    // MARK: - Actions
    
    var transitionManager: TransitionManager?
    
    @IBAction func changeLayout(_ sender: Any) {
        print("change layout")
        let animationDuration = 0.2
        if layoutState == .list {
            layoutState = .grid
            transitionManager = TransitionManager(duration: animationDuration, collectionView: collectionView!, destinationLayout: gridLayout, layoutState: layoutState)
            
            self.rotationButton.image = #imageLiteral(resourceName: "baseline_view_list_black_24pt_1x")
        } else {
            layoutState = .list
            transitionManager = TransitionManager(duration: animationDuration, collectionView: collectionView!, destinationLayout: listLayout, layoutState: layoutState)
            
            self.rotationButton.image = #imageLiteral(resourceName: "baseline_grid_on_black_24pt_1x")
        }
        transitionManager?.startInteractiveTransition()
    }
    
    
    // MARK: - UI Setup
    
    func setupCell() {
        let nib = UINib(nibName: "GridCoffeeCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "grid_coffee_cell")
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = listLayout
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}


// MARK: - UICollectionViewDataSource

extension CoffeeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "grid_coffee_cell", for: indexPath) as! GridCoffeeCell
        let coffee = coffees[indexPath.row]
        cell.dataSource = coffee
        return cell
    }
    
}


// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension CoffeeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
        return customTransitionLayout
    }
    
}










