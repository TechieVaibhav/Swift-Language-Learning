//
//  ViewController.swift
//  Actor
//
//  Created by Vaibhav Sharma on 06/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let obj = flytManager()
        let name = obj.getComanyName() // nonisolated, so no await required.
        print(name)
        // await obj.seats // isolated
        Task.detached(operation: {
            await obj.bookSeat()
        })
        // isolated, so await required.
        Task.detached{
            await obj.getAvailableSeats() // by default isolated, await is required.
        }
    }
}

