//
//  MainViewController.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 12/12/23.
//

import UIKit

class MainViewController: UIViewController {
    
    weak var coordinator: ParentCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Main"
    }


}
