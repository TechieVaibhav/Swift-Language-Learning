//
//  AppCoordinator.swift
//  Co-OrdinaterPatternInDetail
//
//  Created by Vaibhav Sharma on 08/12/23.
//

import Foundation

protocol ChildCoordinateDelegate : AnyObject{
    func handleParentCoordinator()
    func printChildCoordinator()
}

class AppCoordinator : BaseCoordinator, ChildCoordinateDelegate{



    override func start() {
        let isAuth = false
        if !isAuth{
            // Registrtaion Flow
            registraionFlow()
        } else {
            // Main Flow
        }
    }

    func registraionFlow() {
        let child = RegistraionCoordinator(navigationController: navigationController)
        self.addChild(child: child)
        child.delegate = self
        child.start()
    }

    func homeViewFlow() {
        let childHomeCoordinator = HomeCoordinator(navigationController: navigationController)
        self.addChild(child: childHomeCoordinator)
        childHomeCoordinator.delegate = self
        childHomeCoordinator.start()
    }

    // delegates
    func handleParentCoordinator() {
        homeViewFlow()
    }
    // track child coordinators
    func printChildCoordinator() {
        print(childCoordinators?.count ?? "all child are deleted")
    }
}
