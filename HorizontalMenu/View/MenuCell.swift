//
//  MenuCell.swift
//  HorizontalMenu
//
//  Created by Angelos Staboulis on 4/4/21.
//

import UIKit

class MenuCell: UICollectionViewCell {

    @IBOutlet var lblCaption: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        lblCaption.backgroundColor = .clear
    }
}
