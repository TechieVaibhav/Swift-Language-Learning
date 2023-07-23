//
//  AssignSubscriberViewController.swift
//  CombineFrameworkExample
//
//  Created by Vaibhav Sharma on 21/07/23.
//

import UIKit
import Combine

class AssignSubscriberViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var tap: UIButton!
    var currentIncValue = 0
    
    // Publisher
    //PassthroughSubject helps to brodcasting the value
    var publisher = PassthroughSubject<Int, Never>()
    
    var anyCancellable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bindLableWithPublisher()
    }
    
    @IBAction func tapIncrementer(_ sender: Any) {
        currentIncValue = currentIncValue + 1
        publisher.send(currentIncValue)
    }
    
    func bindLableWithPublisher() {
        let resultPublisher = publisher.map({ inputValue in
            return "\(inputValue)"
        })
        
        // assign subscriber.
        // store AnyCancellable instance to deinitalize the subscriber.

        resultPublisher.assign(to: \.text!, on: lbl).store(in: &anyCancellable)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
