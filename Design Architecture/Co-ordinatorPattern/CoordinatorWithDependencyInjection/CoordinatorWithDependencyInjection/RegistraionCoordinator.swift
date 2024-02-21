//
//  RegistraionCoordinator.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 12/12/23.
//

import UIKit

class RegistraionCoordinator : ChildCoordinator{


    override func start() {
        showEnterMobileNumberVC()
    }

    func showEnterMobileNumberVC(){
        let storyBorad = UIStoryboard(name: "Registraion", bundle: nil)
        let vc = storyBorad.instantiateViewController(withIdentifier: "EnterMobileNumberVC") as? EnterMobileNumberVC
        vc?.coordinator = self
        self.navigationController.pushViewController(vc!, animated: true)
    }

    func showEnterNameVC(){
        let storyBorad = UIStoryboard(name: "Registraion", bundle: nil)
        let vc = storyBorad.instantiateViewController(withIdentifier: "EnterNameVC") as? EnterNameVC
        vc?.coordinator = self
        self.navigationController.pushViewController(vc!, animated: true)
    }

    func showEnterAddressVC(){
        let storyBorad = UIStoryboard(name: "Registraion", bundle: nil)
        let vc = storyBorad.instantiateViewController(withIdentifier: "EnterAddressViewController") as? EnterAddressViewController
        vc?.coordinator = self
        self.navigationController.pushViewController(vc!, animated: true)
    }
}

