//
//  MainVC.swift
//  TocaMama
//
//  Created by Michael Dunn on 2016-10-04.
//  Copyright © 2016 Michael Dunn. All rights reserved.
//

import UIKit

class MainVC: UIViewController, TacoDataServiceDelegate{

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var dataService: TacoDataService = TacoDataService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load taco
        dataService = TacoDataService.instance
        dataService.delegate = self
        dataService.loadTaco()
        dataService.tacos.shuffle()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        headerView.addDropShadow()
        
        /*  Old way of loading data
        let nib = UINib(nibName: "TacoCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TacoCell")
        */
        
        collectionView.register(TacoCell.self)
    }
    
    func tacoDataLoaded() {
        print("Taco Loaded")
        collectionView.reloadData()
    }

}



extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // Old way to dequeue
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TacoCell", for: indexPath) as? TacoCell {
//            cell.configureCell(taco: dataService.tacos[indexPath.row])
//            return cell
//        } else {
//            return UICollectionViewCell()
//        }
// 
        // Protocol way to dequeue.  see UICollectionView+Ext
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as TacoCell
        cell.configureCell(taco: dataService.tacos[indexPath.row])
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.tacos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TacoCell {
            cell.shake()
        }
    }
    
    // Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
}
