//
//  RefactorAssignSubscriberViewController.swift
//  CombineFrameworkExample
//
//  Created by Vaibhav Sharma on 21/07/23.
//

import UIKit
import Combine

class RefactorAssignSubscriberViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    
    var counter = Counter()
    var anyCancel = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bind()
    }
    

    @IBAction func tapToIncrement(_ sender: Any) {
        counter.increment()
    }
    
    func bind() {
        counter.$value.assign(to: \.text!, on: lbl).store(in: &anyCancel)
    }

}


class Counter{
    
    // @Published a property wrapper which is a Publisher here
    @Published private (set) var value : String = "0"
    
    var counter = 0
    
    func increment(){
        counter = counter + 1
        value = "\(counter)"
    }
}
