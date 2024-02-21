import UIKit

// Delegate Design Pattern: Delegate Design Pattern is used to get call back/ passing data from next to previous controller.


//Example 1 :
protocol Work : AnyObject{
    func doSomeWork()
}


class Employee: Work {
    func doSomeWork() {
        print(" **** Start Your Daily Work Activity ***")
    }
}

class Boss{
    weak var delegate : Work?
}

let employee = Employee()
let boss = Boss()
boss.delegate = employee
boss.delegate?.doSomeWork()


//Example 2 :

protocol SelectedMovie : AnyObject{
    func onSelectedMovie()
}




class MovieList :SelectedMovie{
    func onSelectedMovie() {
        print(" **** get call back from movieDetails.. ***")
    }
}

class MovieDetail{
    weak var delegate : SelectedMovie?


}
let movieList = MovieList()
let movieDetail = MovieDetail()
movieDetail.delegate = movieList
movieDetail.delegate?.onSelectedMovie()



// what is Protocol vs Delegate, what is differnece between Protocol and Delegate.

// Protocol is a set of rule/functions , functions can be required/optional.
// delegate is a reference of those class which are confirming to the protocol( a protocol owner class).

