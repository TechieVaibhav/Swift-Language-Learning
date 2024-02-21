//
//  Factory.swift
//  FactoryDesignPattern
//
//  Created by Vaibhav Sharma on 23/01/24.
//

import Foundation
class Factory {
    func createReport(type : ReportType) -> ReportProtocol{
        switch type {
        case .profit:
            return ProfitReport()
        case .tax:
            return TaxReport()
        }
    }
}
