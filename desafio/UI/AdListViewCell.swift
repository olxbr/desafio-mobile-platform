//
//  AdListViewCell.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit

class AdListViewCell: UICollectionViewCell {
    
    @IBOutlet weak var adDate: UILabel!
    @IBOutlet weak var adPrice: InsetLabel!
    @IBOutlet weak var adTitle: UILabel!
    @IBOutlet weak var adImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.setupUI()
    }

    func setup(ad: Ad) {
        self.adTitle.text = ad.ad.subject
    }
}
