//
//  CatRepoRepository.swift
//  App test
//
//  Created by ToThang on 12/11/22.
//

import Foundation
import RxSwift

class CatRepoRepository: DogRepoRepositoryType {
    private let api: Network = Network.share
    private var dogEntities = [CDDogEntity]()
    
    func getDogRandom() -> Observable<CatEntity> {
        return api.callApi(url: "https://aws.random.cat/meow")
    }
    
    func saveDogImage(model: CatEntity) {
        let newCat = CDDogEntity(context: AppDelegate.sharedAppDelegate.persistentContainer.viewContext)
        newCat.setValue(model.file, forKey: #keyPath(CDDogEntity.url))
        self.dogEntities.insert(newCat, at: 0)
        AppDelegate.sharedAppDelegate.saveContext()
    }

}
