//
//  MainViewModel.swift
//  App test
//
//  Created by ThangTQ on 05/12/2022.
//

import Foundation
import RxRelay
import SwinjectStoryboard
import RxSwift

class MainViewModel {
    let network = SwinjectStoryboard.defaultContainer.resolve(Network<DogEntity>.self)!
    let dogSequence = PublishRelay<DogEntity>()
    let disposeBag = DisposeBag()
    
    func loadImage() {
        network.callApi(url: "https://dog.ceo/api/breeds/image/random")
        network.result.subscribe({ [weak self] val in
            guard let dog = val.element else { return }
            self?.dogSequence.accept(dog)
        }).disposed(by: disposeBag)
    }
}
