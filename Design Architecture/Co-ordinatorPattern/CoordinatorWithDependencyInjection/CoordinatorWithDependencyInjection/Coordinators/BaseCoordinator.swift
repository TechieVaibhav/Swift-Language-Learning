//
//  BaseCoordinator.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 11/12/23.
//

import UIKit
class BaseCoordinator : Coordinator{
    var onCoordinatorCompletion: coordinatorCompletion?
    
    var navigationController: UINavigationController
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {

    }

    func goBack() {
        self.navigationController.popViewController(animated: true)
    }
}
