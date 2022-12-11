//
// Created by FABBI on 25/05/2022.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup () {
        defaultContainer.register(MainViewModel<DogEntity>.self) { _ in
            return MainViewModel(useCase: DogUseCase())
        }
        defaultContainer.register(MainViewModel<CatEntity>.self) { _ in
            return MainViewModel<CatEntity>(useCase: CatUseCase())
        }
    }
}

