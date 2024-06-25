//
//  MockAPINetworkService.swift
//  APITestApp
//
//  Created by Vaibhav Sharma on 06/06/24.
//

import Foundation
class MockAPINetworkService : NetworkService{

    func fetchAPIData(onComplition : @escaping (Data?,Error?)-> Void) {
        let jsonString = """
{
title : "Ajay"
genre : "Sunny"
}
"""
        if let data = jsonString.data(using: .utf8){
            onComplition(data,nil)
        } else{
            let error = NSError(domain: "Mock Network Error", code: -1, userInfo: nil)
            onComplition(nil,error)
        }
    }
}

