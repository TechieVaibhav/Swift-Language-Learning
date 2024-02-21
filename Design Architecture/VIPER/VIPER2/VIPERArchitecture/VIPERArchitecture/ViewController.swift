//
//  ViewController.swift
//  VIPERArchitecture
//
//  Created by Vaibhav Sharma on 21/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var redColorValue: UISlider!
    @IBOutlet weak var greenColorValue: UISlider!
    @IBOutlet weak var blueColorValue: UISlider!
    
    var presenter : ViewToPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetUp()
        loadValue()
    }

    func initialSetUp(){
        redColorValue.minimumValue = 0.0
        redColorValue.maximumValue = 255.0
        greenColorValue.minimumValue = 0.0
        greenColorValue.maximumValue = 255.0
        blueColorValue.minimumValue = 0.0
        blueColorValue.maximumValue = 255.0
    }

    func loadValue(){
        let currentRGB = presenter?.loadCurrentColor()

        let red = currentRGB?.red ?? 0
        let green = currentRGB?.green ?? 0
        let blue = currentRGB?.blue ?? 0

        redColorValue.value = red
        greenColorValue.value = green
        blueColorValue.value = blue
        self.view.backgroundColor = UIColor(red: (CGFloat(red)/255), green: (CGFloat(green)/255), blue: (CGFloat(blue)/255), alpha: 1)
        let finalValue = "RGB \(red),\(green),\(blue)"
        lbl.text = finalValue
    }

    @IBAction func onRedColorChanged(_ sender: UISlider) {

        colorValueChanged()
    }


    @IBAction func onGreenColorChanged(_ sender: UISlider) {

        colorValueChanged()
    }

    @IBAction func onBlueColorChanged(_ sender: UISlider) {

        colorValueChanged()
    }

}

extension ViewController {

    func colorValueChanged() {
        let step : Float = 1

        _ = CGFloat(round(self.redColorValue.value/step) * step)
        _ = CGFloat(round(self.greenColorValue.value/step) * step)
        _ = CGFloat(round(self.blueColorValue.value/step) * step)

        //presenter?.saveCurrentColor(rgb: (red, green, blue))
    }
}

extension ViewController : PresenterToView{
    func updateViewBackgroundColor(rgb: (CGFloat, CGFloat, CGFloat)) {
        let finalValue = "RGB \(rgb.0),\(rgb.1),\(rgb.2)"
        lbl.text = finalValue
        self.view.backgroundColor = UIColor(red: rgb.0/255, green: rgb.1/255, blue: rgb.2/255, alpha: 1)
        print(finalValue)
    }
}
