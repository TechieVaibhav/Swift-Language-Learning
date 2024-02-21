//
//  HomeCoordinator.swift
//  Co-OrdinaterPatternInDetail
//
//  Created by Vaibhav Sharma on 08/12/23.
//

import UIKit

class HomeCoordinator : BaseCoordinator{
    weak var delegate: ChildCoordinateDelegate?
    override func start() {
        showMainVC()
    }

    func showMainVC() {
        let storyBorad = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyBorad.instantiateViewController(withIdentifier: "MainVC") as? MainVC
        vc?.coordinator = self
        self.navigationController.setViewControllers([vc!], animated: true)
    }

}
