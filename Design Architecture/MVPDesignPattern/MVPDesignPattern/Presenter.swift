//
//  Presenter.swift
//  MVPDesignPattern
//
//  Created by Vaibhav Sharma on 29/11/23.
//

import Foundation
import UIKit

protocol PresenterView : AnyObject{
    func updateView()
}

class Presenter{

    weak var view : PresenterView?
    var taps = 0
    init(view: PresenterView) {
        self.view = view
    }

    func countTaps(tapTimes : Int) {
        self.taps += tapTimes
        debugPrint(taps)
        if taps > 4{
            self.view?.updateView()
        }
    }
}


