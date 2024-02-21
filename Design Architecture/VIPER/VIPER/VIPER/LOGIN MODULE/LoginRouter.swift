//
//  LoginRouter.swift
//  VIPER
//
//  Created by Vaibhav Sharma on 27/12/23.
//

import UIKit

class LoginRouter : PresenterToRouter{

    static func createModule() -> LoginViewController {
        guard let loginVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return UIViewController() as! LoginViewController }
        
        let presenter = LoginPresenter()

        let interactor = LoginInteractor()
        let router = LoginRouter()

        loginVC.presenter = presenter
        presenter.view = loginVC
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return loginVC
    }


}
