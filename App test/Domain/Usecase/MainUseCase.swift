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
        let request = GithubRepoRequest(page: 1)
        let repository = GithubRepoRepository()
        return repository.getGithubRepos(input: request)
    }
}
