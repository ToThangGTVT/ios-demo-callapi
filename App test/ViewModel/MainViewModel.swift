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
import RxCocoa

struct MainViewModel {
    let useCase: MainUseCaseType
}

extension MainViewModel {
        
    struct Input {
        let selectDog: Driver<Void>
    }
    
    struct Output {
        let repos: Driver<DogEntity>
    }
    
    func transform(_ input: MainViewModel.Input) -> MainViewModel.Output {
        let repo = useCase.getRepos().asDriver(onErrorJustReturn: DogEntity())
        return Output(repos: repo)
    }
}
