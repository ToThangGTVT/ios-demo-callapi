//
//  Network.swift
//  App test
//
//  Created by FABBI on 25/05/2022.
//

import Foundation

protocol NetworkInterface: AnyObject {
    func callApi();
    var delegate: NetworkDelegate? { get set}
}

protocol NetworkDelegate: AnyObject {
    func didCallApi(dog: DogEntity);
}

class Network: NetworkInterface {

    weak var delegate: NetworkDelegate?

    func callApi() {
        NSLog("Call API::::::")
        var request = URLRequest(url: URL(string: "https://dog.ceo/api/breeds/image/random")!)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(DogEntity.self, from: data!)
                print(responseModel)
                self.delegate?.didCallApi(dog: responseModel)
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
        NSLog("End Call API::::::")
    }
}
