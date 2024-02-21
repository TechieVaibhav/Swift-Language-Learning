//
//  ReportRequestViewModel.swift
//  FactoryDesignPattern
//
//  Created by Vaibhav Sharma on 23/01/24.
//

import Foundation

enum ReportType {
    case tax
    case profit
}
/*
class ProfitReport {
    func getReport() -> Array<Report>{
        print("You will get a report about Profit")
        return [Report()]
    }
}

class TaxReport {
    func getReport()-> Array<Report> {
        print("You will get a report about Tax")
        return [Report()]
    }
}

//Wrong Way to deal with things

class ReportRequestViewModel {

    let taxReport = TaxReport()
    let profitReport = ProfitReport()
    /*
     Here if a new type is introduce, then you have to add those type here and also crearing a concrete object for that new type , let suppose new type is `Loss Report`, then
     let lossReport = LossReport()
     so that a big problem statement, it will directly break the single Responsiblity principle, because VM does not have responsibilty to create the new objects when a new requirement is introduce.
     */
    func getReport(type : ReportType) -> Array<Report>{
        switch type {
        case .profit:
            return profitReport.getReport()
        case .tax:
            return taxReport.getReport()
        }
    }
}
*/

// Correct way, by factory pattern
// we will create a protocol for factory pattern, Factory pattern - delaing with protocol , instead of concerete objects, factory pattern will return the protocol from fuction as a return result.
protocol ReportProtocol {
    func getReport()-> Array<Report>
}

class ProfitReport : ReportProtocol{
    func getReport() -> Array<Report>{
        print("You will get a report about Profit")
        return [Report()]
    }
}

class TaxReport : ReportProtocol{
    func getReport()-> Array<Report> {
        print("You will get a report about Tax")
        return [Report()]
    }
}



class ReportRequestViewModel {

    let reportProtocol : ReportProtocol
    init(reportProtocol: ReportProtocol) {
        self.reportProtocol = reportProtocol

    }

    /*
     correct way by factory, we just take care for protocol, protocol confirmed classes will response.
     */
    func getReport() -> Array<Report>{
        return reportProtocol.getReport()
    }
}
