//
//  ViewController.swift
//  COOrdinatorPattern
//
//  Created by Vaibhav Sharma on 03/12/23.
//

import UIKit

class AppController: UIViewController {
     weak var coordinator : COOrdinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(coordinator ?? "nil")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(coordinator ?? "nil")
    }

}

