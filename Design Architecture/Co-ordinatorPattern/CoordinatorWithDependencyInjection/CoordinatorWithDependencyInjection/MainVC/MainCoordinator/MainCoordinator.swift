//
//  MainCoordinator.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 12/12/23.
//

import UIKit
class MainCoordinator : ChildCoordinator{


    override func start() {
        showMainVC()
    }

    func showMainVC(){
        let storyBorad = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBorad.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        vc?.coordinator = parentCoordinator
        self.navigationController.setViewControllers([vc!], animated: true)
    }

}

