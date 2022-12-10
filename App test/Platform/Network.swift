//
//  Network.swift
//  App test
//
//  Created by FABBI on 25/05/2022.
//

import Foundation
import RxRelay
import RxSwift

class Network {
    
    static let share = Network()
    
    private init() {
        
    }

    func callApi<T: Codable>(url: String) -> Observable<T> {
        NSLog("Call API::::::")
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        return Observable.create { observable in
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(T.self, from: data!)
                    print(responseModel)
                    observable.onNext(responseModel)
                } catch {
                    print("JSON Serialization error")
                }
            }).resume()
            return Disposables.create()
        }
    }
}
