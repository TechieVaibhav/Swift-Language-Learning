//
//  Coordinator.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 11/12/23.
//

import UIKit

protocol Coordinator{
    var navigationController : UINavigationController { get set}
    var onCoordinatorCompletion : coordinatorCompletion? { get set}

    func start()
    func goBack()
}
