//
//  FlowCompletion.swift
//  CoordinatorWithDependencyInjection
//
//  Created by Vaibhav Sharma on 12/12/23.
//

import Foundation

protocol FlowCompletion {
   
    var completionHandler : (T)->Void
}
