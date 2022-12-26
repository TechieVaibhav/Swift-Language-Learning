import UIKit

/*************** Concurreny in Swift ***************/

// Before start any task, system creates a Queue to execute these task.
// Queue either a Serial Queue or Concurrent Queue.
// Serial Queue : that meant only one thread available.
// Concurrent Queue : that meant multiple threads are available.
// Synchronous and Asynchronous Task: Synchronous task maints a order of execution whenever Asynchronous task does not maintain the execution order.

// Synchronous Task : A, B, C, D there are total 4 task , so as per Synchronous , A is complte first then B will start the execution, then C & D as well.block the execution process.
//For exmp :- Synchronous Task means follow a queue(line) to buy the ticket in PVR Cinema, one by one order of execution is availabe.


// Asynchronous Task : A, B, C, D there are total 4 task , so as per Asynchronous , may be A is complte first then B will start the execution, or C & D can be exexcute first before A & B. Here execution depends upon task complexity instead of order.does not block the execution process.
// So when you want to execute any task, then system allocate a queue for every task.
// So Asynchronous does not equal to Concurrent.

//For exmp :- Asynchronous Task means does not follow a queue(line) to buy the ticket in  local Cinema Hall/Desi daru shop, which hands is lucky gets the ticket/daru , no order of execution is availabe.

// So look at here :

//Serial Queue + SYNCHRONOUS Task ==> Order => [so Order will maintain].
//Serial Queue + ASYNCHRONOUS Task ==> Order =>  so Order will maintain (because there is only one thread available).
//Concurrent Queue + SYNCHRONOUS Task ==> Order =>  [so Order will maintain].
//Concurrent Queue + ASYNCHRONOUS Task ==> might be Unorder => [Order will not maintain].

// practicle
/*
func serialQueueWithSynchronous() {
    let serialQueue = DispatchQueue(label: "vaibhav.queue")
    //one thread
    serialQueue.sync {
        print("Task 1 is started")
        for i in 1...5{
            print("Task[\(i)] is here....")
        }
        print("Task 1 is finished")
    }
    //second thread
    serialQueue.sync {
        print("Task 2 is started")
    
        print("Task 2 is finished")
    }
}

serialQueueWithSynchronous()
 */

// Output:
//Task 1 is started
//Task[1] is here....
//Task[2] is here....
//Task[3] is here....
//Task[4] is here....
//Task[5] is here....
//Task 1 is finished
//Task 2 is started
//Task 2 is finished

// Conclusion : here we can easily notice `Task1` is started first and finished first then `Task2` will start.


/*
func serialQueueWithAsynchronous() {
    //serialQueue
    let serialQueue = DispatchQueue(label: "vaibhav.queue")
    //one thread
    serialQueue.async {
        print("Task 1 is started")
        for i in 1...6{
            print("Task[\(i)] is here....")
        }
        print("Task 1 is finished")
    }
    //second thread
    serialQueue.async {
        print("Task 2 is started")
        for i in 1...2{
            print("Task2[\(i)] is here....")
        }
        print("Task 2 is finished")
    }
}

serialQueueWithAsynchronous()
*/

// Output:
//Task 1 is started
//Task[1] is here....
//Task[2] is here....
//Task[3] is here....
//Task[4] is here....
//Task[5] is here....
//Task[6] is here....

//Task 1 is finished
//Task 2 is started
//Task2[1] is here....
//Task2[2] is here....
//Task 2 is finished

// Conclusion : here we can easily notice `Task1` is started first and finished first then `Task2` will start.here `Task1` is having heavy operation compare to `Task2`, but task1 is complete first because serial queue having a single thread.




/*
func concurentQueueWithSynchronous() {
    //Concurrent Queue
    let concurrentQueue = DispatchQueue(label: "vaibhav.queue",attributes: .concurrent)
    //one thread
    concurrentQueue.sync {
        print("Task 1 is started")
        for i in 1...3{
            print("Task[\(i)] is here....")
        }
        print("Task 1 is finished")
    }
    //second thread
    concurrentQueue.sync {
        print("Task 2 is started")
        for i in 1...2{
            print("Task2[\(i)] is here....")
        }
        print("Task 2 is finished")
    }
}

concurentQueueWithSynchronous()
*/

// Output:
//Task 1 is started
//Task[1] is here....
//Task[2] is here....
//Task[3] is here....
//Task 1 is finished

//Task 2 is started
//Task2[1] is here....
//Task2[2] is here....
//Task 2 is finished

// Conclusion : here we can easily notice `Task1` is started first and finished first then `Task2` will start.here `Task1` is having heavy operation compare to `Task2`, but task1 is complete first because we enforce our task to behave synchronously, that meant blocking the execution process whenever we are having multiple threads due to concurent queue.

/*
func concurentQueueWithAsynchronous() {
    //Concurrent Queue
    let concurrentQueue = DispatchQueue(label: "vaibhav.queue",attributes: .concurrent)
    //one thread
    concurrentQueue.async {
        print("Task 1 is started")
        for i in 1...3{
            print("TaskA[\(i)] is here....")
        }
        print("Task 1 is finished")
    }
    //second thread
    concurrentQueue.async {
        print("Task 2 is started")
        for i in 1...2{
            print("TaskB[\(i)] is here....")
        }
        
        print("Task 2 is finished")
    }
}

concurentQueueWithAsynchronous()
*/
// Output:
//Task 1 is started
//Task 2 is started

//TaskB[1] is here....
//TaskA[1] is here....
//TaskB[2] is here....
//TaskA[2] is here....
//Task 2 is finished

//TaskA[3] is here....
//Task 1 is finished

// Conclusion : here we can easily notice `Task1` is started first and `Task2` is also started.here `Task1` is having heavy operation compare to `Task2`, so task2 is complete first because we enforce our task to behave Asynchronously, that meant execution process is Unordered, here we are not blocking the execution process.

