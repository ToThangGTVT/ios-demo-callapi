//
//  Usecase.swift
//  App test
//
//  Created by ThangTQ on 05/12/2022.
//

import Foundation
import RxSwift

protocol MainUseCaseType {
    associatedtype T

    func getData<T>() -> Observable<T>
}
