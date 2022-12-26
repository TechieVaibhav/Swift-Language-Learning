import UIKit
enum AllDateSuffixFormates : String{
    case Year = " year ago"
    case Years =  " years ago"
    case Months = " months ago"
    case Month = " month ago"
    case Minutes = " mins ago"
    case Second = " sec ago"
    // case Minute = " m ago"
    case Hours = " h ago"
    //case Hour = " h ago"
    case Days = " days ago"
    case Day = " day ago"
    case Yesterday = "Yesterday"
    case Today = "Today"
    case Ago = " ago"
}
extension Date{
    
    var toTimeStamp:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    //it gives you date from time stamp
    init(timeStamp:Int64) {
      //  self = Date(timeIntervalSince1970: TimeInterval(timeStamp/1000))
        let epochTime = TimeInterval(timeStamp) / 1000
        self = Date(timeIntervalSince1970: epochTime)
 
        //  self = Date(timeIntervalSince1970: TimeInterval(timeStamp / 1000))
        //self = Date(timeIntervalSince1970: TimeInterval(timeStamp) / 1000)
    }
    func timeAgoSinceDate(endDate:Date, numericDates:Bool = false) -> String? {
        var cal = Calendar.current
        cal.timeZone = TimeZone.current//TimeZone(abbreviation: "UTC")!
        let components = cal.dateComponents([.year, .month, .day,.hour,.minute,.second], from: self, to: endDate)
        
        if let year = components.year, year > 0 {
            return year == 1 ? "\(year)" +  AllDateSuffixFormates.Year.rawValue :
                "\(year)" + AllDateSuffixFormates.Years.rawValue
        }
        
        else if let month = components.month, month > 0 {
            return month == 1 ?  "\(month)" + AllDateSuffixFormates.Month.rawValue :
                "\(month)" + AllDateSuffixFormates.Months.rawValue
        }
        else if let day = components.day, day > 0 {
            return day == 1 ? AllDateSuffixFormates.Day.rawValue :
                "\(day)" + AllDateSuffixFormates.Days.rawValue
        }
        else if let hour = components.hour, hour > 0 {
            return  "\(hour)" + AllDateSuffixFormates.Hours.rawValue
        }
        else if let minute = components.minute, minute > 0 {
            return    "\(minute)" + AllDateSuffixFormates.Minutes.rawValue
        } else if let second = components.second, second > 0 {
            return    "\(second)" + AllDateSuffixFormates.Minutes.rawValue
        }
        else {
            return "Now"
        }
        
    }
}

//"lastTransactionTimestamp":1622460870000
//1622460870000
//1622461306000
let lastTransactionTimestamp: CLongLong = 1622468540000
let currentTimestamp:CLongLong = 1622468571649
//1622460970054

//May 31, 2021 at 5:06 PM --> 1622460970054


//May 31, 2021 at 5:09 PM --> 1622461198175

//let diff :CLongLong  = currentTimestamp - lastTransactionTimestamp
//print(diff)

let startDate = Date(timeStamp: lastTransactionTimestamp )
print(startDate)
let endDate = Date(timeStamp: currentTimestamp )
print(endDate)
let result =  startDate.timeAgoSinceDate(endDate: endDate)

