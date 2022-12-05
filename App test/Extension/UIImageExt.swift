//
// Created by FABBI on 25/05/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ urlImage: String?) {

        if urlImage == nil {
            self.image = UIImage(named: "img_Default")
            return
        }

        guard let url = URL(string: urlImage ?? "") else { return }
        let placeHolder = UIImage(named: "img_Default")
        self.kf.indicatorType = .activity
        self.kf.setImage(with: ImageResource(downloadURL: url), placeholder: placeHolder)
    }

    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    func configGrandient() {
        let gradientLayer = CAGradientLayer()
        let gradientColor = UIColor.black.withAlphaComponent(0.5)
        gradientLayer.colors = [gradientColor.cgColor, UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = self.bounds
        self.layer.addSublayer(gradientLayer)
    }
}
