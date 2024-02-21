//
//  DetailViewController.swift
//  COOrdinatorPattern
//
//  Created by Vaibhav Sharma on 04/12/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lbl: UILabel!
   
    weak var coordinator : COOrdinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbl.text = "Welcome detail screen"
    }

}
