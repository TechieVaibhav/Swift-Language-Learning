import UIKit






func checkDate(date : Date){
    let newDate = getNextDate(curentDate: date)
    //MM/dd/yyyy
    let dateComponents = DateComponents(calendar: Calendar.current, day: 7)
    let nextDate = Calendar.current.date(byAdding: dateComponents, to: date) ?? Date()
    
    
    if newDate < nextDate {print("Date A is earlier than date B")}
    else if newDate > nextDate {   print("Date A is later than date B")}
    else if newDate == nextDate {   print("The two dates are the same")
    }
}

func getNextDate(curentDate : Date) -> Date{
    let dateComponents = DateComponents(calendar: Calendar.current, minute: 2)
    let nextDate = Calendar.current.date(byAdding: dateComponents, to: curentDate) ?? Date()
    print(nextDate)
    return nextDate
    
}

checkDate(date: Date())
