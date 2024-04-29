import UIKit

// Single Core -- Single Thread Environment.
// Multi Core -- Multi Threaded Environment, can perform their task in a distributed way, so it is a result of optimized performance.

//Concurrency --> Concurrency also helps to improve the app performance like you have 2 screens, in first screen you are doing something by Dispatch, now you navigate to screen B where you perfrom another 2 or 3 dispatch so now you can seem it can be a  performance issue because user can wait for the execution of the tasks to see the reponse.
// Solution : when you leave A, so schedule Dispatch should be stop/pause so that Screen B can perform their task.

// Synchronous --- is a task -- so if you have 3 task then they execute/perform one by one.

// if A , B, C are 3 task. A will start first when A will stop then B will start their Job, when B finsihed their Job then C will start their Job.

// Asynchronous --- is a task -- so if you have 3 task then they execute/perform without any order.
// if A , B, C are 3 task. So may be A will start first and before finishing of A,  B can also start their Job, also C can start their Job, without finishing of A,B, So finally we can say that order of execution can not be controlled.

// Queue --> follow FIFO to execute the scheduled task.
//Queue --> can be a serial queue or concurrent queue.
//Serial Queue -- Single Thread queue , there is only one singal thread.
//Concurrent Queue -- Multi Thread queue , there is multiple thread.

// So both task (synchronous and Asynchronous both) can be a part of serial Queue also same as Concurrent Queue.

// For Serial Queue or thread -- we can put synchronous and asynchronous task to Serial Queue.

// For Concurrent Queue or thread -- we can put synchronous and asynchronous task to Concurrent Queue.
//Note : Execution follow should be like :

/*
 ***************************************************
 
 // Thread  :   Task                               : Behaviour
 // Serial    :  Synchronous                  :  ORDER
 // Serial    :   Asynchronous               :  ORDER
 // Concurrent    :  Synchronous         :  ORDER
 // Concurrent    :   Asynchronous      :  UNORDER
 
 **************************************************
 */

// Serial Queue
func SerialQueueWithSyn(){
    let serialQueue = DispatchQueue(label: "com.test.com")
    //task 1
    serialQueue.sync {
        print("task 1 started")
        for i in 0...5{
            print(" task 1 with \(i)")
        }
        print("task 1 finished")
    }
    //task 2
    serialQueue.sync {
        print("task 2 started")
        for i in 0...5{
            print(" task 2 with \(i)")
        }
        print("task 2 finished")
    }
    //task 3
    serialQueue.sync {
        print("task 3 started")
        for i in 0...5{
            print(" task 3 with \(i)")
        }
        print("task 3 finished")
    }
}

//SerialQueueWithSyn()  //ORDER TASK EXECUTION

// Serial Queue
func SerialQueueWithAsyn(){
    let serialQueue = DispatchQueue(label: "com.test.com")
    //task 1
    serialQueue.async {
        print("task 1 started")
        for i in 0...5{
            print(" task 1 with \(i)")
        }
        print("task 1 finished")
    }
    //task 2
    serialQueue.async {
        print("task 2 started")
        for i in 0...5{
            print(" task 2 with \(i)")
        }
        print("task 2 finished")
    }
    //task 3
    serialQueue.async {
        print("task 3 started")
        for i in 0...5{
            print(" task 3 with \(i)")
        }
        print("task 3 finished")
    }
}

//ConcurrentQueueWithAsyn()  //ORDER TASK EXECUTION

// Concurrent Queue
func ConcurrentQueueWithSyn(){
    let parrelQueue = DispatchQueue(label: "com.test.com", attributes: .concurrent)
    //task 1
    parrelQueue.sync {
        print("task 1 started")
        for i in 0...5{
            print(" task 1 with \(i)")
        }
        print("task 1 finished")
    }
    //task 2
    parrelQueue.sync {
        print("task 2 started")
        for i in 0...5{
            print(" task 2 with \(i)")
        }
        print("task 2 finished")
    }
    //task 3
    parrelQueue.sync {
        print("task 3 started")
        for i in 0...5{
            print(" task 3 with \(i)")
        }
        print("task 3 finished")
    }
}

//ConcurrentQueueWithSyn() //ORDER TASK EXECUTION
/*
 task 1 started
 task 1 with 0
 task 1 with 1
 task 1 with 2
 task 1 with 3
 task 1 with 4
 task 1 with 5
 task 1 finished
 
 task 2 started
 task 2 with 0
 task 2 with 1
 task 2 with 2
 task 2 with 3
 task 2 with 4
 task 2 with 5
 task 2 finished
 
 task 3 started
 task 3 with 0
 task 3 with 1
 task 3 with 2
 task 3 with 3
 task 3 with 4
 task 3 with 5
 task 3 finished
 */

// Concurrent Queue
func ConcurrentQueueWithAsyn(){
    let parrelQueue = DispatchQueue(label: "com.test.com", attributes: .concurrent)
    //task 1
    parrelQueue.async {
        print("task 1 started")
        for i in 0...5{
            print(" task 1 with \(i)")
        }
        print("task 1 finished")
    }
    //task 2
    parrelQueue.async {
        print("task 2 started")
        for i in 0...5{
            print(" task 2 with \(i)")
        }
        print("task 2 finished")
    }
    //task 3
    parrelQueue.async {
        print("task 3 started")
        for i in 0...5{
            print(" task 3 with \(i)")
        }
        print("task 3 finished")
    }
}

//ConcurrentQueueWithAsyn() // UNORDER TASK EXECUTION
/*
 task 1 started
 task 3 started
 task 2 started
  task 3 with 0
  task 2 with 0
  task 1 with 0
  task 3 with 1
  task 2 with 1
  task 3 with 2
  task 2 with 2
  task 1 with 1
  task 3 with 3
  task 2 with 3
  task 3 with 4
  task 1 with 2
  task 2 with 4
  task 3 with 5
  task 1 with 3
  task 2 with 5
 task 3 finished
 task 2 finished
  task 1 with 4
  task 1 with 5
 task 1 finished

 */

func ConcurrentQueueWithAsyn2(){
    let parrelQueue = DispatchQueue(label: "com.test.com", attributes: .concurrent)
    //task 1
    parrelQueue.async {
        print("task 1 started")
    }
    //task 2
    parrelQueue.async {
        print("task 2 started")
    }
    //task 3
    parrelQueue.async {
        print("task 3 started")
    }
}

//ConcurrentQueueWithAsyn2() // with a simple print command execution is also unordered.
/*
 task 1 started
 task 3 started
 task 2 started
 */

func ConcurrentQueueWithAsyn3(){
    let parrelQueue = DispatchQueue(label: "com.test.com")
    //task 1
    parrelQueue.sync {
        print("task 1 started")
        parrelQueue.async {
            print("task 2 started")
            print("task 2 finished")
        }
        parrelQueue.async {
            print("task 3 started")
            print("task 3 finished")
        }
    }
    //task 2
    
    parrelQueue.async {
        print("task 4 started")
        parrelQueue.async {
            print("task 5 started")
        }
        parrelQueue.async {
            print("task 6 started")
        }
    }
    //task 3
    parrelQueue.sync {
        print("task 10 started")
    }
    //task 4
    parrelQueue.async {
        print("task 7 started")
        parrelQueue.sync {
            print("task 8 started")
        }
    }
}
ConcurrentQueueWithAsyn3() // If async inside sync then it will run but sync inisde async will not run, it create  a deadlock. if any asyn finds sync inside it then it will block the execution on same movement.

/*
 task 1 started
 task 2 started
 task 2 finished
 task 3 started
 task 3 finished
 task 4 started
 task 10 started
 task 5 started
 task 6 started
 task 7 started
 
 */

