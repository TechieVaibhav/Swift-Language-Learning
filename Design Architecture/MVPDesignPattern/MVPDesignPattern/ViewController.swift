//
//  ViewController.swift
//  MVPDesignPattern
//
//  Created by Vaibhav Sharma on 29/11/23.
//

import UIKit

class ViewController: UIViewController {
    var presenter : Presenter?

    @IBOutlet weak var lbl: UILabel!
     var taps = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.presenter = Presenter(view: self)
    }

    @IBAction func tapOnMe(_ sender: UIButton) {

        self.presenter?.countTaps(tapTimes: 1)
    }
    
}

extension ViewController : PresenterView {
    func updateView() {
        self.lbl.text = "Tapped perfectly"
        self.lbl.backgroundColor = .red
    }
}
