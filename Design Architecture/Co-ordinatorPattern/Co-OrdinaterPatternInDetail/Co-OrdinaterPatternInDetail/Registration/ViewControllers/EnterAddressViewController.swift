//
//  EnterAddressViewController.swift
//  Co-OrdinaterPatternInDetail
//
//  Created by Vaibhav Sharma on 07/12/23.
//

import UIKit

class EnterAddressViewController: UIViewController {
    weak var coordinator : RegistraionCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Enter Your Address"
    }

    @IBAction func goToNextVC(_ sender: Any) {
        // you have to go main
        coordinator?.delegate?.handleParentCoordinator()
        coordinator?.removeChild(child: self.coordinator!)
    }
}
