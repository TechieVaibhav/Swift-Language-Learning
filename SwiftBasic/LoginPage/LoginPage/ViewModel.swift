//
//  ViewModel.swift
//  LoginPage
//
//  Created by Vaibhav Sharma on 23/05/24.
//

import Foundation
class ViewModel {

    func doLogin(userName : String, password : String, onSuccess: @escaping (UserData) -> Void, onFailure : @escaping (Error) -> Void) {

        let urlString = ""

        guard let url = URL(string: urlString) else{
            return
        }

        var request = URLRequest(url: url)
        request.setValue(userName, forHTTPHeaderField: "userName")
        request.setValue(password, forHTTPHeaderField: "password")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let error = error else{
                return
            }
            guard let data = data else{
                return
            }

            let jsonDecoder = JSONDecoder()
            do{
                let userData =  try jsonDecoder.decode(UserData.self, from: data)
                onSuccess(userData)
            } catch let error {
                onFailure(error)
            }
        }

    }
}
