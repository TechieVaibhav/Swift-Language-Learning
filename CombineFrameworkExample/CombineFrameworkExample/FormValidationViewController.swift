//
//  FormValidationViewController.swift
//  CombineFrameworkExample
//
//  Created by Vaibhav Sharma on 24/07/23.
//

import UIKit
import Combine

class FormField{
    var hint : String = "Hint"
    @Published var value : String = ""
    
    init(hint : String){
        self.hint = hint
    }
}

struct FormModels{
    let first = FormField(hint: "First")
    let sec = FormField(hint: "Second")
    let third = FormField(hint: "Third")
}


class FormValidationViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var subButton: UIButton!
    
    var cancellablees = Set<AnyCancellable>()
    
    var publisher : AnyPublisher<Bool, Never>!
    var models = FormModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetUP()
        constructPublisher()
        addSubcriber()
    }

    func initialSetUP(){
        textField1.placeholder = FormModels().first.hint
        textField2.placeholder = FormModels().sec.hint
        textField3.placeholder = FormModels().third.hint
        
        textField1.tag = 0
        textField2.tag = 1
        textField3.tag = 2
        
        textField1.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        textField2.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
        textField3.addTarget(self, action: #selector(textChange(_:)), for: .editingChanged)
    }
    
    func constructPublisher() {
        publisher = Publishers.CombineLatest(models.first.$value, models.sec.$value)
            .map({ firstModelValue,secondModelValue -> Bool in
           let isvalid = !firstModelValue.isEmpty && !secondModelValue.isEmpty
            return isvalid
        })
        .eraseToAnyPublisher()
    }
    
    func addSubcriber(){
        publisher.sink { isEnabled in
            self.subButton.isEnabled = isEnabled
        }.store(in: &cancellablees)
    }
    
    @IBAction func submitTap(_ sender: UIButton) {
    print("submitTap")
        
    }
    
    @objc func textChange(_ sender : UITextField){
        
        print(sender.text ?? "")
        switch sender.tag{
        case 0:
            models.first.value = sender.text ?? ""
        case 1:
            models.sec.value = sender.text ?? ""
        case 2:
            models.third.value = sender.text ?? ""
        default:
            break
        }
    }
}
