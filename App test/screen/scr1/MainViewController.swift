//
//  MainViewController.swift
//  App test
//
//  Created by FABBI on 24/05/2022.
//

import UIKit
import SwinjectStoryboard
import ContextMenu

class MainViewController: BaseViewController, UIContextMenuInteractionDelegate {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnTest: UIButton!
    
    var viewModel: NetworkInterface?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let placeholder = self.view!
        Bundle.main.loadNibNamed("MainViewController", owner: self, options: nil)
        placeholder.superview?.insertSubview(self.view, aboveSubview: placeholder)
        placeholder.removeFromSuperview()
        
        let interaction = UIContextMenuInteraction(delegate: self)
        btnTest.addInteraction(interaction)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor("#e0f7fa")
        viewModel = SwinjectStoryboard.defaultContainer.resolve(NetworkInterface.self)!
        viewModel?.delegate = self
        print("Xxx")
    }
    
    @IBAction func clickBtnTest(_ sender: Any) {
        ContextMenu.shared.show(
                    sourceViewController: self,
                    viewController: MyContentViewController(),
                    options: ContextMenu.Options(menuStyle: .default, hapticsStyle: .medium)
                )
    }
    
    @IBAction func clickButton(_ sender: Any) {
        showActivityIndicator()
        viewModel?.callApi()
    }
    
}

extension MainViewController {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestAction in
            
            let menuItem = UIAction(title: "CCCC", image: nil) {
                action in
                
            }
            
            return UIMenu(title: "AAAA", image: nil, identifier: nil, options: UIMenu.Options.singleSelection, children: [menuItem])
            
        }
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


class MyContentViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Demo"
    preferredContentSize = CGSize(width: 200, height: 200)
  }
}
