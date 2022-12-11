//
//  DogTableViewCell.swift
//  App test
//
//  Created by ToThang on 12/10/22.
//

import UIKit
import SwinjectStoryboard

class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgThumb: UIImageView!
    @IBOutlet weak var urlLabel: UILabel!
    var viewModel: MainViewModel? = SwinjectStoryboard.defaultContainer.resolve(MainViewModel<DogEntity>.self)

    @IBAction func pressFavorite(_ sender: Any) {
        
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindView(with: CDDogEntity) {
        urlLabel.text = with.url
        imgThumb.setImage(with.url)
    }
}
