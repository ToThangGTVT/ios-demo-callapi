//
//  DogUseCase.swift
//  App test
//
//  Created by ToThang on 12/11/22.
//

import Foundation
import RxSwift

struct DogUseCase: MainUseCaseType {
    typealias T = DogEntity
    
    func getData<T>() -> RxSwift.Observable<T> {
        let repository = DogRepoRepository()
        return repository.getDogRandom().map({val in
            let _ = repository.saveDogImage(model: val)
            return val as! T
        })
    }
}
