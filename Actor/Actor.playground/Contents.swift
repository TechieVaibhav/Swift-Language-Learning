import UIKit


// Actor - actor are more like class without 'class' keyword. so if you want to create a actor, then replace 'class' keyword with 'actor' keyword.
// so actor are reference type. that mean you pass actor as a function argument, then it passes reference like a class. all shared objects of actor poniting to the same memory location.
// actor basically a protol.
// Limitation of Actor => you can not perform inheritance with actor.
// Advantages : thread safety, all functions in actor look like async function, you can call it safly in concurrent environment.
// Main Advantage : actor prevent the data race condition.
// all functions are async in actor.
// data race condition => when you call a shared resources into a concurrent environment. there is a change of data corruption.
// Example of data race with normal class : ( in viewdidload call functions for data race, not visible in playground).
/*
 class Counter {
 var count = 0

 func increaseCounter() {
 count += 1
 print("count is \(count)")
 }
 func readCounter() {
 print("count is \(count)")
 }
 }

 let obj = Counter()

 let queue = DispatchQueue(label: "ConcurrentIssueQueue", attributes: .concurrent)

 queue.async {
 obj.increaseCounter()
 }

 queue.async {
 obj.readCounter()
 }
 */


actor SafeCounter{
    var count = 0
    init( count : Int) {
        self.count = count
    }
    func increaseCounter() {
        count += 1
        print("counter increaded by \(count)")
    }
    func readCounter(){
        print("final count is \(count)")
    }
}

let safeCounter = SafeCounter(count: 0)

let concurrentQueue = DispatchQueue(label: "ConcurrentIssueQueue", attributes: .concurrent)
concurrentQueue.async {

    Task.detached {
        await safeCounter.increaseCounter()
    }
}

concurrentQueue.async {
    Task.detached {
        await safeCounter.readCounter()
    }
}

// Task - task is used to handle async functions, helps in concurrent environment.


