//
//  BaseCoordinator.swift
//  Co-OrdinaterPatternInDetail
//
//  Created by Vaibhav Sharma on 07/12/23.
//

import UIKit

protocol Coordinator : AnyObject{

    var navigationController : UINavigationController{ get set}
    var childCoordinators : [ Coordinator]? { get set}
    func start()
    func goBack()
    func addChild(child : Coordinator)
    func removeChild(child : Coordinator)
}

class BaseCoordinator : Coordinator{

    var childCoordinators: [ Coordinator]?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func addChild(child:  Coordinator) {
        guard var childCoordinators = childCoordinators, childCoordinators.isEmpty else{
            self.childCoordinators = []
            self.childCoordinators?.append(child)
            return
        }
        childCoordinators.append(child)
    }

    func removeChild(child: Coordinator) {
        guard var childCoordinators = childCoordinators else {
            return
        }
        for (objIndex, _) in childCoordinators.enumerated(){
            childCoordinators.remove(at: objIndex)
        }
    }
    func start() {
        // responsible for creating view controller instance
    }
    
    func goBack() {
        // pop to previous controller
    }

}
