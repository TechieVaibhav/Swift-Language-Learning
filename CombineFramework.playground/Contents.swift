import UIKit
import Combine

//https://ishtiz.com/interview/top-30-combine-framework-interview-questions-answers-2023

// What is Combine framework- combine framework offers a declarative Swift API to processing the values over time and can be seen as a first priority compare to `RXSwift` and `ReactiveSwift`.

// declarative vs imperative programing - In imperative, we have to define the sequence of commands to do things, like as - we have a array of passwords, so let suppose on a signup screen we have to check the user enter the weak password/ previously used passwords, so in imperatiove programing -

// imperative Programing-
func checkPassIsWeakOrStrong(userEnteredPassword : String) -> Bool {
    let previousPassword = ["admin123", "admin123456"]
    if userEnteredPassword.count <= 5{
        print("weak password")
        return false
    }
    
    for pass in previousPassword{
        if pass == userEnteredPassword{
            print("you can not use the previous password")
            return false
        }
    }
    return true
}


// declerative Programing - declerative programing offer us to write a more redable code that reflacts exactly we want to see.
// doning the same thing by high order function -- an example of declerative programing.

func checkPassIsWeakOrStrongDeclerative(userEnteredPassword : String) -> Bool {
    let previousPassword = ["admin123", "admin123456"]
    if userEnteredPassword.count <= 5{
        print("weak password")
        return false
    }
    if previousPassword.contains(userEnteredPassword){
        print("you can not use the previous password")
        return false
    }
    return true
}

// Reactive functional Programming - in general, if we want to handle the network call, then we pass the api result as a complition handler, but in reactive functional programing, we return a publisher which publish the result to it's subscriber.
// In example, Their is a Youtube channel, someone subscribe the channel, so when youtuber post someting new content, then subscriber will recieve a updated/new content notification.

// When to use a reactive programing - when you want new updates for a value over time. let's see a example - you have a UILable, you want to see the updated value should be shown by this labal, so let suppose you have a string variable who will help to set the value to it's lable over time.
// so UILable will be a subscriber to it's string variable(publisher). when variable will change then subscriber gets a updated value call back.


// Benefits of reactive? - you get rid out from the nested tree of closures(nested sequence of closures).

// Let suppose you have an array - you want to publish all values of array, then publisher will publish all array's value-

[1,2,3,4]
    .publisher
    .sink { aCompletion in
        switch aCompletion{
        case .finished:
            print("call is finished")
            
        case .failure(let error):
            print("error is \(error)")
        }
    
    } receiveValue: { newValueReceved in
        print(newValueReceved)
    }


/*
// OUTPUT :
1
2
3
4
call is finished
*/

/*
In Combine, Arrays, Dictionaries,Strings (all sequence type), can be converted to Publishers, by calling Publisher, and to subscribe these Publishers we have to call func sink()[ that publish all elements sepreatly].
*/

let stringPublisher  = "Hello,world".publisher.sink { value in
    print("string value : \(value)")
}

/*
 string value : H
 string value : e
 string value : l
 string value : l
 string value : o
 string value : ,
 string value : w
 string value : o
 string value : r
 string value : l
 string value : d
 */

let fibonacciPublisher  = [0,1,1,2,3,5,8,13].publisher.sink { value in
    print("fibonacci value : \(value)")
}

/*
 fibonacci value : 0
 fibonacci value : 1
 fibonacci value : 1
 fibonacci value : 2
 fibonacci value : 3
 fibonacci value : 5
 fibonacci value : 8
 fibonacci value : 13
 */

let dictPublisher  = ["first":1, "second" : 2].publisher.sink { value in
    print("dictPublisher value : \(value)")
}

/*
 dictPublisher value : (key: "first", value: 1)
 dictPublisher value : (key: "second", value: 2)
 */


let aset : Set<Int> = [1,2,3,4]
    
aset.publisher.sink { value in
    print("set elements : \(value)")
}


let students: [String] = ["Ajay","Vijay","Suresh"]

students.publisher.sink { acompletion in
    switch acompletion{
    case .finished :
        print("finished")
    case .failure(let error):
        print("failuer : \(error)")
    }
} receiveValue: { value in
    print(value)
}


// Subscriber completion enum offer us 2 enum cases .failure and .finished, .failure will call when something went wrong and .finished will be call if subscribtion is finished.


// In Combine - every publisher, even for a single value, will call the complition event with new value.
// When to use combine : - when you want to travel a value from one place to another automatically through subscriptions.


// Publisher - publisher is a protocol, which have 2 important things - associated output, associated failure
// Subscriber - subscriber is a protocol, which have 2 important things- associated input, associated failure.

// Connection - firstly we have to make a connection between Publisher & subscriber, Publisher has subscribe function, which helps to attach the subscriber to Publisher, we can attach the multiple subscriber to a single Publisher.

// life Cycle - Subscriber will attach with Publisher by subscribe function (Publisher protocol function), then Pusblisher will send a subscription acknoweldgement to Subscriber, then subscriber will raise a demand ( request), this demand can be unlimited, in last Publisher will return a complition or error to subscriber.

func addTwoNum(a: Int, b: Int)-> Int{
    return a + b
}

let justpubliser = Just(addTwoNum(a: 10, b: 20))

let justSubscriber = Subscribers.Sink<Int, Never>.init { completion in
    print(completion)
} receiveValue: { value in
    print(value)
}

justpubliser.print().subscribe(justSubscriber)

/*
 receive subscription: (Just)
 request unlimited
 receive value: (30)
 30
 receive finished
 finished
 */



Just(5).map { value in
    return value * 5
}.sink { newValue in
    print(newValue)
}

//25

/*
// Publisher

let timerPublisher = Timer.publish(every: 2.0, on: .main, in: .default).autoconnect()

//subscriber
let subscriber = timerPublisher.sink { acompletion in
    switch acompletion{
    case .finished:
        print("finished")
    case .failure(let error):
        print(error)
    }
} receiveValue: { value in
    print(value)
}
*/


//Operator with publisher.

let dict = [1: "one", 2 : "two", 3 : "three", 5 : "five"]

let number = (0...5)

number.publisher.compactMap{numberKey in
    return dict[numberKey]
}.sink { value in
    print(value)
}

/*
 one
 two
 three
 five
 */




