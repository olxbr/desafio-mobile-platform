import UIKit
import SnapKit

class CatalogViewController: UIViewController {
    var viewModel: CatalogViewModel = CatalogViewModel()
    lazy private var flowLayout: AdListViewLayout = {
        let layout = AdListViewLayout()
        return layout
    }()
    var adsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getAds()
    }
    
    private func setupUI() {
        self.navigationItem.title = "OLX"
        adsCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        adsCollectionView.backgroundColor = UIColor.lightGray
        adsCollectionView.delegate = self
        adsCollectionView.dataSource = self
        adsCollectionView.register(UINib(nibName: "AdListCardViewCell", bundle: nil), forCellWithReuseIdentifier: "AdListCardViewCellIdentifier")
        adsCollectionView.showsVerticalScrollIndicator = false
        adsCollectionView.isPagingEnabled = true
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    public func buildViewHierarchy() {
        self.view.addSubview(adsCollectionView)
    }
    
    public func setupConstraints() {
        adsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
    
    }
    
    private func getAds() {
        viewModel.getAds(request: nil).then(on: .main) { response in
            self.viewModel.updateAds(list: response.list_ads ?? [])
            DispatchQueue.main.async {
                self.adsCollectionView.reloadData()
            }
        }.catch(on: .main) { error in
            DispatchQueue.main.async {
                self.adsCollectionView.reloadData()
            }
        }
    }

}

extension CatalogViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.ads.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = adsCollectionView.dequeueReusableCell(withReuseIdentifier: "AdListCardViewCellIdentifier", for: indexPath) as? AdListCardViewCell, !viewModel.ads.isEmpty else {
            return UICollectionViewCell()
        }
        cell.configure(ad: viewModel.ads[indexPath.row])
        return cell
    }
}
