//
// Created by FABBI on 25/05/2022.
//

import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup () {
        defaultContainer.register(NetworkInterface.self) {
            _ in return Network()
        }
    }
}

