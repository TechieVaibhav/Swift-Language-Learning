//
//  EnterMobileNumberVC.swift
//  Co-OrdinaterPatternInDetail
//
//  Created by Vaibhav Sharma on 07/12/23.
//

import UIKit

class EnterMobileNumberVC: UIViewController {
     weak var coordinator : RegistraionCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Enter Your Mobile Number"
        print(coordinator ?? "EnterMobileNumberVC not init")
    }

    @IBAction func goToNextVC(_ sender: Any) {
        coordinator?.showEnterNameVC()
        print(coordinator ?? "not init")
    }
}
