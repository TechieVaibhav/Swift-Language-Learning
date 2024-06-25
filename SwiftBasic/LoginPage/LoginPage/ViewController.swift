//
//  ViewController.swift
//  LoginPage
//
//  Created by Vaibhav Sharma on 23/05/24.
//

import UIKit

class ViewController: UIViewController {

    var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func submitBtnCall(userName : String, password : String) {
        viewModel.doLogin(userName: userName, password: password) { userData in
            // on success result

        } onFailure: { error in
            // on failure result

        }

    }

}

