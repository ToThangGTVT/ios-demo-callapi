//
//  DogRepoRepository.swift
//  App test
//
//  Created by ToThang on 12/11/22.
//

import Foundation
import RxSwift

class DogRepoRepository: DogRepoRepositoryType {
    private let api: Network = Network.share
    private var dogEntities = [CDDogEntity]()
    
    func getDogRandom() -> Observable<DogEntity> {
        return api.callApi(url: "https://dog.ceo/api/breeds/image/random")
    }
    
    func saveDogImage(model: DogEntity) {
        let newDog = CDDogEntity(context: AppDelegate.sharedAppDelegate.persistentContainer.viewContext)
        newDog.setValue(model.message, forKey: #keyPath(CDDogEntity.url))
        self.dogEntities.insert(newDog, at: 0)
        AppDelegate.sharedAppDelegate.saveContext()
    }

}

