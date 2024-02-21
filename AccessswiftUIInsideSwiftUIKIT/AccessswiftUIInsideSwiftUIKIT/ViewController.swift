//
//  ViewController.swift
//  AccessswiftUIInsideSwiftUIKIT
//
//  Created by Vaibhav Sharma on 07/02/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLbL()
    }

    @MainActor func updateLbL() {
        lbl.text = "Hello Sharma ji"
    }


    @IBAction func loadSwiftUI(_ sender: Any) {
        loadSwiftUI()
    }

    func loadSwiftUI() {
        let swiftUI = SwiftUIView()
        let hostingVC = UIHostingController(rootView: swiftUI)
        present(hostingVC, animated: true)
    }
}

