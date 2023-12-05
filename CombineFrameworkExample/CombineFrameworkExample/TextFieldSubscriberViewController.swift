//
//  TextFieldSubscriberViewController.swift
//  CombineFrameworkExample
//
//  Created by Vaibhav Sharma on 24/07/23.
//

import UIKit
import Combine

class TextFieldSubscriberViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bind()
    }
    
    func bind(){
        textField.textFieldPublisher.sink { value in
            print(value)
        }.store(in: &cancellables)
    }
}

extension UITextField{
    
    var textFieldPublisher: AnyPublisher< String, Never>{
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { notification in
                notification.object as? UITextField
            }.map { textField in
                textField.text ?? ""
            }.eraseToAnyPublisher()
    }
}
