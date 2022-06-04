//
//  APIService.swift
//  UnitTestCaseDemo
//
//  Created by Krishna Gunjal on 03/06/22.
//

import SwiftUI

enum DataError: Error {
    case networkError
    case parsing
    case invalidURL
}

struct APIService {
    static let shared = APIService()
    private init(){}
    
    func getData(completionHandler: @escaping (Result<[Album], DataError>) -> Void) {
        let urlString = Constants.url!
        
        guard let dataURI = URL(string: urlString) else {
            completionHandler(.failure(.networkError))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: dataURI, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil, response != nil else {
                completionHandler(.failure(.networkError))
                return
            }

            do {
                // Decode the json data.
                let decoder = JSONDecoder()
                let response = try decoder.decode([Album].self, from: data)
                completionHandler(.success(response))
            } catch {
                print(error)
                completionHandler(.failure(.parsing))
            }
        })
        dataTask.resume()
    }
    
}

