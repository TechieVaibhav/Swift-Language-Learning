//
//  COOrdinator.swift
//  COOrdinatorPattern
//
//  Created by Vaibhav Sharma on 03/12/23.
//

import Foundation
import UIKit

class COOrdinator{

    var navigationController : UINavigationController?

    init(rootNavigation: UINavigationController) {
        self.navigationController = rootNavigation
    }

    func start() {
        let storyborad = UIStoryboard(name: "AppLogin", bundle: nil)
        let vc = storyborad.instantiateViewController(withIdentifier: "AppController") as? AppController
        vc?.coordinator = self
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}

