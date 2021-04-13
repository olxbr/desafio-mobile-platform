//
//  AdsListViewController.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit

class AdsListViewController: UIViewController {
    
    // Mark: properties
    
    var ads: [Ad] = []
    lazy private var flowLayout: AdListViewLayout = {
        let layout = AdListViewLayout()
        return layout
    }()
    
    // Mark: outlets

    @IBOutlet weak var adsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adsCollectionView.delegate = self
    }
    


}

// MARK: UICollectionViewDataSource

extension AdsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: AdListViewCell.reuseIdentifier(), for: indexPath) as? AdListViewCell, !ads.isEmpty else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}

// MARK: Setup

extension AdsListViewController {
    
    private func setupUI() {
            adsCollectionView.delegate = self
            adsCollectionView.dataSource = self
            adsCollectionView.collectionViewLayout = flowLayout
            adsCollectionView.register(UINib(nibName: "AdListViewCell", bundle: nil), forCellWithReuseIdentifier: "AdListViewCell")
       
    }
    
}
