//
//  CoordinatorFactory.swift
//  Co-OrdinaterPatternInDetail
//
//  Created by Vaibhav Sharma on 07/12/23.
//

import UIKit

class CoordinatorFactory {
    static func createRegistraionCoordinator(navigationController: UINavigationController) -> RegistraionCoordinator {
        return RegistraionCoordinator(navigationController: navigationController)
    }
}
