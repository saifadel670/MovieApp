//
//  Network.swift
//  MovieApp
//
//  Created by saif adel on 2/3/21.
//

import Foundation
import Alamofire

class Network{
    private init(){}
    
    static let shared = Network()
    
    func get<T: Decodable>(for model: T, method: String, completion: @escaping (T?, Error?) -> ()) {
        AF.request("\(Api.baseURL)\(method)\(Api.endURL)").responseJSON{
            (response) in
            switch response.result{
            case .success:
                guard let data = response.data else { return }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result, nil)
                }catch let error {
                    completion(nil,error)
                }
            case.failure(let error):
                completion(nil, error)
            }
        }
    }
}
