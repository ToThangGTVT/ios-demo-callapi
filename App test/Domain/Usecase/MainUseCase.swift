//
//  Usecase.swift
//  App test
//
//  Created by ThangTQ on 05/12/2022.
//

import Foundation
import RxSwift

protocol MainUseCaseType {
    func getRepos() -> Observable<DogEntity>
}

struct MainUseCase: MainUseCaseType {
    
    func getRepos() -> Observable<DogEntity> {
        let repository = DogRepoRepository()
        return repository.getDogRandom()
    }
}
