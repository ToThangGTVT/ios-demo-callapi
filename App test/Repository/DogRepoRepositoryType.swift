//
//  DogRepository.swift
//  App test
//
//  Created by ToThang on 12/5/22.
//

import Foundation
import RxSwift

protocol DogRepoRepositoryType {
    associatedtype T
    func getDogRandom() -> Observable<T>
    func saveDogImage(model: T)
}
