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
    let session = URLSession.shared
    let url = URL(string: "https://nga.olx.com.br/api/v1.2/public/ads?lim=25&region=11&sort=relevance&state=1&lang=pt")!

    // Mark: outlets

    @IBOutlet weak var adsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getAds()
    }
    
    // Mark: REST
    
    private func getAds() {
        
        ProductApiClient.listProducts(request: nil).then(on: .main) { response in
            
            self.ads = response.list_ads ?? []
            DispatchQueue.main.async {
                self.adsCollectionView.reloadData()
            }
        }.catch(on: .main) { error in
            self.ads =  []
            DispatchQueue.main.async {
                self.adsCollectionView.reloadData()
            }
        }
        
//        let task = session.dataTask(with: url, completionHandler: { data, response, error in
//            // Check the response
//            print(response)
//            if error != nil {
//                print(error)
//                return
//            }
//            // Serialize the data into an object
//            do {
//                let json = try JSONDecoder().decode(ListAds.self, from: data! )
//                print(json)
//                self.ads = json.list_ads ?? []
//                DispatchQueue.main.async {
//                    self.adsCollectionView.reloadData()
//                }
//            } catch {
//                print("Error during JSON serialization: \(error.localizedDescription)")
//            }
//        })
//        task.resume()
    }

}

// MARK: UICollectionViewDataSource

extension AdsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: "AdListCardViewCellIdentifier", for: indexPath) as? AdListCardViewCell, !ads.isEmpty else {
            return UICollectionViewCell()
        }
        cell.configure(ad: ads[indexPath.row])
        return cell
    }
}

// MARK: Setup

extension AdsListViewController {
    
    private func setupUI() {
            adsCollectionView.delegate = self
            adsCollectionView.dataSource = self
            adsCollectionView.collectionViewLayout = flowLayout
            adsCollectionView.register(UINib(nibName: "AdListCardViewCell", bundle: nil), forCellWithReuseIdentifier: "AdListCardViewCellIdentifier")
    }
}
