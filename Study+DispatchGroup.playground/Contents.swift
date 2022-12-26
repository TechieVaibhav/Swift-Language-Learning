import UIKit

//DispatchGroup : (DispatchGroup means group of dispatch queue that means we can use multuple queues) When you want to perform multiple task(or group of jobs) , then you can put your jobs/taks into a group, and group will notify you when all schedule task are done.

// When to use Dispatch group : where we need to perform multiple task like hit multiple apis, need to download multiple files.




// DispathGroup provides the `notify(queue :)` method , which notify you when all scheduled task are done.
//`notify(queue :)` method is asynchronous method.

func notifyDispatchGroupWithSingleQueue(){
    
    let dispatchGroup = DispatchGroup()
    let firstQueue = DispatchQueue(label: "My.abc.com")
    
    firstQueue.async(group: dispatchGroup) {
        // first call goes here..
        for i in 0...5{
            print("firstQueue is called by \(i)")
        }
        
    }
    firstQueue.async(group: dispatchGroup) {
        // second call goes here..
        print("secondQueue is called")
    }
    dispatchGroup.notify(queue: DispatchQueue.main) {
        // final call back here...
        print("**** ALL TASK ARE DONE ****")
    }
}


//notifyDispatchGroupWithSingleQueue()

// OUTPUT :
//firstQueue is called by 0
//firstQueue is called by 1
//firstQueue is called by 2
//firstQueue is called by 3
//firstQueue is called by 4
//firstQueue is called by 5
//secondQueue is called
//**** ALL TASK ARE DONE ****

// Note : due to serial queue, execution order is serial (top to bottom).



func notifyDispatchGroupWith2Queue(){
    
    let dispatchGroup = DispatchGroup()
    let firstQueue = DispatchQueue(label: "My.abc.com")
    let secQueue = DispatchQueue(label: "My.another.com")
    //one thread
    firstQueue.async(group: dispatchGroup) {
        // first call goes here..
        for i in 0...5{
            print("firstQueue is called by \(i)")
        }
        
    }
    //second thread
    secQueue.async(group: dispatchGroup) {
        // second call goes here..
        print("secondQueue is called")
    }
    dispatchGroup.notify(queue: DispatchQueue.main) {
        // final call back here...
        print("**** ALL TASK ARE DONE ****")
    }
}


//notifyDispatchGroupWith2Queue()

// OUTPUT :

//secondQueue is called
//firstQueue is called by 0
//firstQueue is called by 1
//firstQueue is called by 2
//firstQueue is called by 3
//firstQueue is called by 4
//firstQueue is called by 5
//**** ALL TASK ARE DONE ****

// Note : due to serial queue, execution order is serial (top to bottom), but here total 2 dispatchQueue, that meant 2 threads, one thread is having heavy opertion compare to 2nd one, so first will take time and 2nd is executed first.



func notifyDispatchGroupWith2QueuewithMoreStuff(){
    
    let dispatchGroup = DispatchGroup()
    let firstQueue = DispatchQueue(label: "My.abc.com")
    let secQueue = DispatchQueue(label: "My.another.com")
    //first thread
    firstQueue.async(group: dispatchGroup) {
        // first call goes here..
        for i in 0...3{
            print("firstQueue is called by \(i)")
        }
        
    }
    firstQueue.async(group: dispatchGroup) {
    
        print("firstQueue is called by for smaller job")
        
    }
    //second thread
    secQueue.async(group: dispatchGroup) {
        // second call goes here..
        print("secondQueue is called")
    }
    dispatchGroup.notify(queue: DispatchQueue.main) {
        // final call back here...
        print("**** ALL TASK ARE DONE ****")
    }
}


//notifyDispatchGroupWith2QueuewithMoreStuff()
// OUTPUT :

//secondQueue is called
//firstQueue is called by 0
//firstQueue is called by 1
//firstQueue is called by 2
//firstQueue is called by 3
//firstQueue is called by for smaller job
//**** ALL TASK ARE DONE ****

func notifyDispatchGroupWith2QueuewithMoreHeavyStuff(){
    
    let dispatchGroup = DispatchGroup()
    let firstQueue = DispatchQueue(label: "My.abc.com")
    let secQueue = DispatchQueue(label: "My.another.com")
    firstQueue.async(group: dispatchGroup) {
        // first call goes here..
        for i in 0...3{
            print("firstQueue is called for \(i)")
        }
        
    }
    firstQueue.async(group: dispatchGroup) {
        for i in 0...3{
            print("next firstQueue is working for \(i)")
        }
    }
    secQueue.async(group: dispatchGroup) {
        // second call goes here..
        for i in 0...6{
            print("secQueue is runing for \(i)")
        }
    }
    dispatchGroup.notify(queue: DispatchQueue.main) {
        // final call back here...
        print("**** ALL TASK ARE DONE ****")
    }
}

// notifyDispatchGroupWith2QueuewithMoreHeavyStuff()

// OUTPUT :
// on first time call :-

//firstQueue is called for 0
//secQueue is runing for 0
//firstQueue is called for 1
//secQueue is runing for 1
//firstQueue is called for 2
//secQueue is runing for 2
//firstQueue is called for 3
//secQueue is runing for 3
//next firstQueue is working for 0
//secQueue is runing for 4
//next firstQueue is working for 1
//secQueue is runing for 5
//next firstQueue is working for 2
//secQueue is runing for 6
//next firstQueue is working for 3
//**** ALL TASK ARE DONE ****

// On second time call :-

//secQueue is runing for 0
//firstQueue is called for 0
//secQueue is runing for 1
//firstQueue is called for 1
//secQueue is runing for 2
//secQueue is runing for 3
//firstQueue is called for 2
//secQueue is runing for 4
//firstQueue is called for 3
//secQueue is runing for 5
//next firstQueue is working for 0
//next firstQueue is working for 1
//secQueue is runing for 6
//next firstQueue is working for 2
//next firstQueue is working for 3
//**** ALL TASK ARE DONE ****

// Note : due to serial queue, execution order should be serial (top to bottom), but here total 2 dispatchQueue, that meant 2 threads, both threads having heavy opertion, so now task execution is Handeled by OS, order of output totally depends upon OS, we can esaliy see if we call this function multiple times then might be every time we get new output, due to OS dependency.

/************  Wait with Dispatch Group **********************/
// wait : so wait will block the current queue untill all jobs have finished.so there is a parameter to specify the time interval for waiting, if the queue is not finish their job for this time period then, then you will get a timeout call back but queue still continue their job, so it just a callback which tell you about timeout so that you can monitor the runing task into DispatchGroup. so if you not specified the time then it will wait for infinite (here infinite means utill all taks have been done).


func waitWithDispatchGroup(){
    
    let dispatchGroup = DispatchGroup()
    //concurent queue (might be having multiple threads, depends upon OS)
    let firstQueue = DispatchQueue.global(qos: .userInitiated)
    firstQueue.async(group: dispatchGroup) {
        // first call goes here..
        print("firstQueue is started")
        Thread.sleep(until: Date().addingTimeInterval(8))
        print("firstQueue is ended")
    }
    firstQueue.async(group: dispatchGroup) {
        for i in 0...3{
            print("next firstQueue is working for \(i)")
        }
    }
    dispatchGroup.notify(queue: DispatchQueue.main) {
        // final call back here...
        print("**** ALL TASK ARE DONE ****")
    }
    
    if dispatchGroup.wait(timeout: .now() + 5) == .timedOut {
        print("**** Time is over ****")
    } else {
        print("**** ALL TASK ARE DONE UNDER TIME ****")
    }
}

//waitWithDispatchGroup()

// OUTPUT :

//firstQueue is started
//next firstQueue is working for 0
//next firstQueue is working for 1
//next firstQueue is working for 2
//next firstQueue is working for 3
// once the timeout is happened, then you will get a simple callback for better resource utilization.
//**** Time is over ****
//firstQueue is ended
//**** ALL TASK ARE DONE ****



func waitWithDispatchGroupForInfinite(){
    
    let dispatchGroup = DispatchGroup()
    //concurent queue (might be having multiple threads, depends upon OS)
    let firstQueue = DispatchQueue.global(qos: .userInitiated)
    firstQueue.async(group: dispatchGroup) {
        // first call goes here..
        print("firstQueue is started")
        Thread.sleep(until: Date().addingTimeInterval(8))
        print("firstQueue is ended")
    }
    firstQueue.async(group: dispatchGroup) {
        for i in 0...3{
            print("next firstQueue is working for \(i)")
        }
    }
    dispatchGroup.notify(queue: DispatchQueue.main) {
        // final call back here...
        print("**** ALL TASK ARE DONE ****")
    }
    
    dispatchGroup.wait()
}

//waitWithDispatchGroupForInfinite()

// OUTPUT :

//firstQueue is started
//next firstQueue is working for 0
//next firstQueue is working for 1
//next firstQueue is working for 2
//next firstQueue is working for 3
// here wait will block the current queue untill all task have been finished.
//firstQueue is ended
//**** ALL TASK ARE DONE ****
