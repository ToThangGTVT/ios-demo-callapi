//
// Created by FABBI on 25/05/2022.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup () {
        defaultContainer.register(Network<DogEntity>.self) {
            _ in return Network()
        }
        defaultContainer.register(MainViewModel.self) {
            _ in return MainViewModel()
        }
    }
}

