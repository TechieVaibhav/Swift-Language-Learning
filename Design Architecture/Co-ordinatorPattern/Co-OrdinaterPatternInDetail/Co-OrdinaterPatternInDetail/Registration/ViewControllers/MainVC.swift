//
//  MainVC.swift
//  Co-OrdinaterPatternInDetail
//
//  Created by Vaibhav Sharma on 08/12/23.
//

import UIKit

class MainVC : UIViewController{
    
    weak var coordinator : HomeCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(coordinator ?? "not init home view")
        print(coordinator?.delegate?.printChildCoordinator() ?? "not init home view")
    }
}
