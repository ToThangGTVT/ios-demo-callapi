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
    
    var viewModelDog: MainViewModel? = SwinjectStoryboard.defaultContainer.resolve(MainViewModel<DogEntity>.self)!
    var viewModelCat: MainViewModel? = SwinjectStoryboard.defaultContainer.resolve(MainViewModel<CatEntity>.self)!
    
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
        let input = MainViewModel<DogEntity>.Input(selectDog: btnGetDog.rx.tap.asDriver())
        let output = viewModelDog?.transform(input)
        
        output?.repos.drive(onNext: { [weak self] val in
            DispatchQueue.main.async {
                self?.img.setImage(val.message)
                print(val)
            }
        }).disposed(by: self.disposeBag)
    }
    
    @IBAction func clickGetDog(_ sender: Any) {
        let input = MainViewModel<DogEntity>.Input(selectDog: btnGetDog.rx.tap.asDriver())
        let output = viewModelDog?.transform(input)
        
        output?.repos.drive(onNext: { [weak self] val in
            DispatchQueue.main.async {
                self?.img.setImage(val.message)
                print(val)
            }
        }).disposed(by: self.disposeBag)
    }

    @IBAction func clickGetCat(_ sender: Any) {
        let input = MainViewModel<CatEntity>.Input(selectDog: btnGetDog.rx.tap.asDriver())
        let output = viewModelCat?.transform(input)
        
        output?.repos.drive(onNext: { [weak self] val in
            DispatchQueue.main.async {
                self?.img.setImage(val.file)
            }
        }).disposed(by: self.disposeBag)

    }
}
