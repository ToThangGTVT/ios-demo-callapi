//
//  DogTableViewCell.swift
//  App test
//
//  Created by ToThang on 12/10/22.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgThumb: UIImageView!
    @IBOutlet weak var urlLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindView(with: CDDogEntity) {
        urlLabel.text = with.url
        imgThumb.setImage(with.url)
    }
    
}
