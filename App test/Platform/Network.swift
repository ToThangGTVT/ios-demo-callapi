//
//  Network.swift
//  App test
//
//  Created by FABBI on 25/05/2022.
//

import Foundation
import RxRelay
import RxSwift

class Network<T: Codable> {
    var result = PublishRelay<T>()

    func callApi(url: String) {
        NSLog("Call API::::::")
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"

        return URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(T.self, from: data!)
                print(responseModel)
                self.result.accept(responseModel)
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
}
