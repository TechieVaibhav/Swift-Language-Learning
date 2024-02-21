//
//  HomeViewBuilder.swift
//  VIPERArchitecture
//
//  Created by Vaibhav Sharma on 21/01/24.
//

import UIKit

protocol ViewToPresenter {
    var view : PresenterToView?{ set get }
    var router : PresenterToRouter?{ set get }
    var interactor : PresenterToInteractor?{ set get }

    func loadCurrentColor() -> (red:Float, green:Float, blue:Float)
}
protocol PresenterToView {
    func updateViewBackgroundColor(rgb: (CGFloat, CGFloat, CGFloat))
}

protocol PresenterToInteractor {
    func loadCurrentColor() -> (red: Float, green: Float, blue: Float)
    func saveCurrentColor(rgb : (CGFloat, CGFloat, CGFloat))
}

protocol InteractorToPresenter {

}

protocol PresenterToRouter {

}

class Presenter : ViewToPresenter{

    var view: PresenterToView?
    var router: PresenterToRouter?
    var interactor: PresenterToInteractor?

    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) {
        interactor?.saveCurrentColor(rgb: rgb)
    }

    func loadCurrentColor() -> (red: Float, green: Float, blue: Float) {
        return interactor?.loadCurrentColor() ?? (red: Float(0), green: Float(0), blue: Float(0))
    }
}

extension Presenter : InteractorToPresenter{

}


class Router : PresenterToRouter{

}
class Interactor : PresenterToInteractor{
    func loadCurrentColor() -> (red: Float, green: Float, blue: Float) {
        let red = UserDefaults.standard.float(forKey: "Red")
        let green =  UserDefaults.standard.float(forKey: "Green")
        let blue = UserDefaults.standard.float(forKey: "Bluee")
        return (red,green,blue)
    }
    
    func colorValueChanged() {

    }
    
    var presenter : InteractorToPresenter?

    func saveCurrentColor(rgb : (CGFloat, CGFloat, CGFloat)) {
        UserDefaults.standard.setValue(rgb.0, forKey: "Red")
        UserDefaults.standard.setValue(rgb.1, forKey: "Green")
        UserDefaults.standard.setValue(rgb.2, forKey: "Bluee")
    }

}

class HomeViewBuilder {

    static func createModule()-> ViewController{
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()
        vc?.presenter = presenter
        vc?.presenter?.view = vc // PresenterToView confirm by viewcontroller
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter // InteractorToPresenter confirm by presenter
        return vc!
    }
}
