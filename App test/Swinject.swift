//
// Created by FABBI on 25/05/2022.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup () {
        defaultContainer.register(MainViewModel.self) { _ in
            return MainViewModel(useCase: MainUseCase())
        }
    }
}

