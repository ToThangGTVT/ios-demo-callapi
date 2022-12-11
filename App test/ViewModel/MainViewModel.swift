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

struct MainViewModel<T: Animal> {
    let useCase: any MainUseCaseType
}

extension MainViewModel {
        
    struct Input {
        let selectDog: Driver<Void>?
    }
    
    struct Output<T> {
        let repos: Driver<T>
    }
    
    func transform(_ input: MainViewModel.Input) -> MainViewModel.Output<T> {
        let repo = useCase.getData().asDriver(onErrorJustReturn: T()) as AnyObject
        return Output(repos: repo as! SharedSequence<DriverSharingStrategy, T>)
    }
}
