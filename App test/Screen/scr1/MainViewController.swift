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
    
    var viewModel: MainViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configAction()
    }
    
    func configUI() {
        self.view.backgroundColor = UIColor("#e0f7fa")
        title = "Demo"
        preferredContentSize = CGSize(width: 200, height: 200)
    }
    
    func configAction() {
        viewModel = SwinjectStoryboard.defaultContainer.resolve(MainViewModel.self)!
        btnGetDog?.rx.tap.asDriver().drive(onNext: { [weak self] val in
            self?.viewModel?.loadImage()
        }).disposed(by: disposeBag)
        
        viewModel?.dogSequence.subscribe({ [weak self] event in
            self?.img.setImage(event.element?.message)
        }).disposed(by: disposeBag)
    }
}
