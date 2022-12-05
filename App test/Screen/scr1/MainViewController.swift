//
//  MainViewController.swift
//  App test
//
//  Created by FABBI on 24/05/2022.
//

import UIKit
import SwinjectStoryboard
import ContextMenu
import RxCocoa
import RxSwift

class MainViewController: BaseViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnTest: UIButton!
    @IBOutlet weak var btnGetDog: UIButton!
    var disposeBag = DisposeBag()
    
    var viewModel: MainViewModel? = SwinjectStoryboard.defaultContainer.resolve(MainViewModel.self)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configUI()
        configAction()
    }
    
    func configUI() {
        self.view.backgroundColor = UIColor("#e0f7fa")
        title = "Demo"
        preferredContentSize = CGSize(width: 200, height: 200)
    }
    
    func configAction() {
        let input = MainViewModel.Input(selectDog: btnGetDog.rx.tap.asDriver())
        let output = viewModel?.transform(input)
        
        output?.repos.drive(onNext: { [weak self] val in
            DispatchQueue.main.async {
                self?.img.setImage(val.message)
            }
        }).disposed(by: self.disposeBag)
    }
    
    @IBAction func clickGetDog(_ sender: Any) {
        let input = MainViewModel.Input(selectDog: btnGetDog.rx.tap.asDriver())
        let output = viewModel?.transform(input)
        
        output?.repos.drive(onNext: { [weak self] val in
            DispatchQueue.main.async {
                self?.img.setImage(val.message)
            }
        }).disposed(by: self.disposeBag)
    }

}
