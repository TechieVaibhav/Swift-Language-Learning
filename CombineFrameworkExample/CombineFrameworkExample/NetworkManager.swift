//
//  NetworkManager.swift
//  CombineFrameworkExample
//
//  Created by Vaibhav Sharma on 02/06/23.
//

import Foundation

enum MYCustomError : String, Error{
    case invalidUrl = "The url is invalid"
    case invalidData = "The data is invalid"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getUserPosts(url: String, completion : @escaping (Result<[Posts], MYCustomError>) -> Void){
        
        guard let url = URL(string: url) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data{
                let jsonDecoder = JSONDecoder()
                do{
                    let posts = try jsonDecoder.decode([Posts].self, from: data)
                    completion(.success(posts))
            } catch{
                    completion(.failure(.invalidData))
                }
            } else{
                completion(.failure(.invalidUrl))
            }
        }
        task.resume()
    }
    
}
