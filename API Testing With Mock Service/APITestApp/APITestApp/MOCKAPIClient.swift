//
//  MOCKAPIClient.swift
//  APITestApp
//
//  Created by Vaibhav Sharma on 06/06/24.
//

import Foundation
protocol NetworkService {
    func fetchAPIData(onComplition : @escaping (Data?,Error?)-> Void)
}

class MOCKAPIClient {
    private let networkService : NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    func fetchMovieList(onCompletion : @escaping (Result<Movie,Error>)-> Void){

    }
}
