//
//  ChildCoordinator.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 11/12/23.
//

import UIKit

class ChildCoordinator : Coordinator{
    var onCoordinatorCompletion: coordinatorCompletion?
    
    var navigationController: UINavigationController
    weak var parentCoordinator : ParentCoordinator?

    init(parent: ParentCoordinator? = nil, navigationController: UINavigationController) {
        self.parentCoordinator = parent
        self.navigationController = navigationController
    }
    func start() {

    }
    
    func goBack() {

    }
}
