//
//  MainViewController.swift
//  App test
//
//  Created by FABBI on 24/05/2022.
//

import UIKit
import SwinjectStoryboard

class MainViewController: BaseViewController {

    @IBOutlet weak var img: UIImageView!
    var viewModel: NetworkInterface?

    override func awakeFromNib() {
        super.awakeFromNib()
        let placeholder = self.view!
        Bundle.main.loadNibNamed("MainViewController", owner: self, options: nil)
        placeholder.superview?.insertSubview(self.view, aboveSubview: placeholder)
        placeholder.removeFromSuperview()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor("#e0f7fa")
        viewModel = SwinjectStoryboard.defaultContainer.resolve(NetworkInterface.self)!
        viewModel?.delegate = self
        print("Xxx")
    }
    
    @IBAction func clickButton(_ sender: Any) {
        showActivityIndicator()
        viewModel?.callApi()
    }
    
}

extension MainViewController: NetworkDelegate {
    func didCallApi(dog: DogEntity) {
        DispatchQueue.main.async {
            self.img.setImage(dog.message)
            self.hideActivityIndicator()
        }
    }
}
