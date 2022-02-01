//
//  CitiesTableViewCell.swift
//  FirstTableView
//
//  Created by Михаил Фролов on 16.01.2022.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCityCell: UIImageView!
    
    @IBOutlet private weak var labelCityCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .darkGray
        labelCityCell.textColor = .white
        imageViewCityCell.contentMode = .scaleAspectFill
        selectionStyle = .default
    }

    func updateCell(name: String, image: UIImage) {
        labelCityCell.text = name
        imageViewCityCell.image = image
    }

}
