//
//  LoginPresenter.swift
//  VIPER
//
//  Created by Vaibhav Sharma on 27/12/23.
//

import Foundation

class LoginPresenter : ViewToPresenter{

    
    var view: PresenterToView?

    var router: PresenterToRouter?

    var interactor: PresenterToInteractor?

    func fetchLblText() {
        interactor?.provideLblText()
    }


}

extension LoginPresenter : InteractorToPresenter {
    func finished(stringText: String) {
        view?.updateLblText(text: stringText)
    }

}
