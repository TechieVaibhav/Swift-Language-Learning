//
//  Router.swift
//  VIPER
//
//  Created by Vaibhav Sharma on 21/12/23.
//

import Foundation

// Router
// it helps to instantiate the VC
// like a wireframe( navigation handler one screen to another screen)

protocol ViewToPresenter : AnyObject{

    var view: PresenterToView? { get set}
    var router: PresenterToRouter? { get set}
    var interactor : PresenterToInteractor? {get set}
    func fetchLblText()
}

protocol PresenterToView : AnyObject{
    func updateLblText(text : String)

}
protocol PresenterToInteractor : AnyObject{
    func provideLblText()
}

protocol InteractorToPresenter : AnyObject{
    func finished(stringText : String)
}

protocol PresenterToRouter : AnyObject{
    static func createModule() -> LoginViewController
}

