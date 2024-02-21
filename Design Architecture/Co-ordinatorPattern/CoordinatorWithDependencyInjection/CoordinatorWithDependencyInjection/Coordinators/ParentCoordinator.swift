//
//  ParentCoordinator.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 11/12/23.
//

import Foundation

typealias coordinatorCompletion = ()->Void

class ParentCoordinator : BaseCoordinator{
    var childCoordinator : [ChildCoordinator]?

    override func start() {
        registraionFlow()
    }

    func registraionFlow() {
        let child = RegistraionCoordinator(parent: self, navigationController: navigationController)
        self.addChild(child: child)
        child.start()
        child.onCoordinatorCompletion = { [weak self] in
            self?.removeChild(child: child)
            self?.mainFlow()
        }
    }

    func addChild(child:  ChildCoordinator) {
        guard var childCoordinators = childCoordinator, childCoordinators.isEmpty else{
            self.childCoordinator = []
            self.childCoordinator?.append(child)
            return
        }
        childCoordinators.append(child)
    }
    func removeChild(child: ChildCoordinator) {
        guard let childCoordinators = self.childCoordinator else {
            return
        }
        for (objIndex, _) in childCoordinators.enumerated(){
            self.childCoordinator?.remove(at: objIndex)
        }
    }
    func mainFlow() {
        let child = MainCoordinator(parent: self, navigationController: navigationController)
        self.addChild(child: child)
        child.start()
    }
}
