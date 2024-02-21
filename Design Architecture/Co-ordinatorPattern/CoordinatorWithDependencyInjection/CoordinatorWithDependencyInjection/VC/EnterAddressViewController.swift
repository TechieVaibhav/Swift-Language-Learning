//
//  EnterAddressViewController.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 12/12/23.
//

import UIKit

class EnterAddressViewController: UIViewController {
    weak var coordinator : RegistraionCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Enter Your Address"
    }

    @IBAction func goToNextVC(_ sender: UIButton) {
        coordinator?.onCoordinatorCompletion?()
    }
}
