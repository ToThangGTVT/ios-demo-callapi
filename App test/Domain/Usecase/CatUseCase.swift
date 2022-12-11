//
//  CatUseCase.swift
//  App test
//
//  Created by ToThang on 12/11/22.
//

import Foundation

import Foundation
import RxSwift

struct CatUseCase: MainUseCaseType {
    typealias T = CatEntity
    
    func getData<T>() -> RxSwift.Observable<T> {
        let repository = CatRepoRepository()
        return repository.getDogRandom().map({val in
            let _ = repository.saveDogImage(model: val)
            return val as! T
        })
    }
}
