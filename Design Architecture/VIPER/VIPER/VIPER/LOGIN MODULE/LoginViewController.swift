//
//  ViewController.swift
//  VIPER
//
//  Created by Vaibhav Sharma on 21/12/23.
//

import UIKit

class LoginViewController: UIViewController {
   
    var presenter: ViewToPresenter?

    @IBOutlet weak var lblMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.fetchLblText()

    }
}

extension LoginViewController: PresenterToView {
    func updateLblText(text: String) {
        lblMessage.text = text
    }

}
