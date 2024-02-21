//
//  Actor.swift
//  Actor
//
//  Created by Vaibhav Sharma on 06/02/24.
//

import Foundation

enum SeatNumber{
    func getSeatNumber(num : Int) -> String{
        switch num {
        case 1 :
            return "A1"
        case 2 :
            return "A2"
        case 3 :
            return "B1"
        case 4 :
            return "B2"
        default:
            break
        }
        return ""
    }
}

actor flytManager{
    nonisolated let companyName = "SpyJeat"
     var seats = ["A1", "A2","B1", "B2"]

     func getAvailableSeats() {
        print("seats number's :\(seats)")
    }
     func bookSeat(number : String = "A1") {
        guard let seat = seats.firstIndex(of: number) else {
            return
        }
         seats.remove(at: seat)
        print("booked seat number :\(number)")
    }

    nonisolated func getComanyName() -> String {
        return companyName
    }
}
