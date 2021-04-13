//
//  AdListViewCell.swift
//  desafio
//
//  Created by Fernando Luiz Goulart on 13/04/21.
//

import UIKit

class AdListViewCell: UICollectionViewCell {
    @IBOutlet weak var adTitle: UILabel!
    
    @IBOutlet weak var adImage: UIImageView!
    @IBOutlet weak var adPrice: UILabel!
    
    @IBOutlet weak var adLocationDate: UILabel!
    static func nibName() -> String {
        return "AdListViewCell"
    }
    static func reuseIdentifier() -> String {
        return "AdListViewCellIdentifier"
    }
}
