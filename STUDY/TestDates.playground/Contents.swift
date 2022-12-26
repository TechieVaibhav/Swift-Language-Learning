import UIKit

//print(isCompleted())
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
            self = Date(timeIntervalSince1970: TimeInterval(timeStamp) / 1000)
        }
    func getStringFromDate(formatterString: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatterString
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")! as TimeZone
        dateFormatter.amSymbol = "AM"
        return dateFormatter.string(from: self)
    }
    
    func timeAgoSinceDate(endDate:Date, numericDates:Bool = false) -> String? {
        
        let components = Calendar.current.dateComponents([.year, .month, .day,.hour,.minute,.second], from: self, to: endDate)
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

let lastTransactionTimestamp: CLongLong = 1620926799000
let currentTimestamp : CLongLong = 1620930039000

let startdate = Date(timeStamp: lastTransactionTimestamp)
let enddate = Date(timeStamp : currentTimestamp)

let result = startdate.timeAgoSinceDate(endDate: enddate, numericDates: false)
print("result : \(String(describing: result))")
