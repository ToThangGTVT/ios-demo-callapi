//
//  DogRepository.swift
//  App test
//
//  Created by ToThang on 12/5/22.
//

import Foundation
import RxSwift

protocol DogRepoRepositoryType {
    func getDogRandom() -> Observable<DogEntity>
}

class DogRepoRepository: DogRepoRepositoryType {
    private let api: Network = Network.share
    
    func getDogRandom() -> Observable<DogEntity> {
        return api.callApi(url: "https://dog.ceo/api/breeds/image/random")
    }
}

