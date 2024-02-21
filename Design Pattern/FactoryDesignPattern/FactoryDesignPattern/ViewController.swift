//
//  ViewController.swift
//  FactoryDesignPattern
//
//  Created by Vaibhav Sharma on 23/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        let vm = ReportRequestViewModel()
        let _ = vm.getReport(type: .profit) //You will get a report about Profit
         */
        let vm = ReportRequestViewModel(reportProtocol: Factory().createReport(type: .tax))
        _ = vm.getReport()
    }

}

