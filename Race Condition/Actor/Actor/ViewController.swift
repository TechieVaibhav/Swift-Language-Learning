//
//  ViewController.swift
//  Actor
//
//  Created by Vaibhav Sharma on 01/02/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        let obj = Shasank()
        let queue = DispatchQueue(label: "Environment",attributes: .concurrent)
        queue.async {
            Task.detached {
                await obj.purchase(productName: "beer")
            }
        }
        queue.async {
            Task.detached {
                await obj.getAvailableProductList()
            }
        }
    }
}  
actor Shasank{
 var stocks = ["beer", "rum", "vat69", "cold drinks"]

    func purchase(productName : String) {
        guard let index = stocks.firstIndex(of: productName) else {
            return
        }
        stocks.remove(at: index)
        print("congratulations purchase ....")
    }
    func getAvailableProductList(){
            print(" all list \(stocks)")
    }
}



class Counter{

    var arr = ["iphone 13", "samsung", "vivo"]

    var dispatchQueue = DispatchQueue(label: "MyQueue",attributes: .concurrent)

    func purchase(productname : String) {
        dispatchQueue.asyncAndWait(flags: .barrier) {
            guard let index = arr.firstIndex(of: productname) else { return}
            arr.remove(at: index)
            print("congratulations for purchasing...")
        }

    }

    func getAvailableProductList(){
        dispatchQueue.asyncAndWait(flags: .barrier) {
            print(" all list \(arr)")
        }
    }
}

/*
Actor - More like a class but actually actor is a protocol
 no inheritance, actaully it's a protocol itself.
 properties all async

 */




