//
//  LoginInteractor.swift
//  VIPER
//
//  Created by Vaibhav Sharma on 27/12/23.
//

import Foundation

class LoginInteractor : PresenterToInteractor{

    var presenter : InteractorToPresenter?

    func provideLblText() {
        let str = "let me do"
        presenter?.finished(stringText: str)
    }
}
