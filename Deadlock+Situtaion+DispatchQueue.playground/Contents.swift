import UIKit

// Deadlock Situtaion : when you access the main thread with synchronously, it leads to deadlock situation.

func deadLockSituation(){
    //DispatchQueue.main - main is a serial thread.
    DispatchQueue.main.sync {
    print("block the main thread, leads to a deadlock situation")
    }
}

// deadLockSituation() //leads to a deadlock situation



func deadLockSituationWillNotHappen(){
    let queue = DispatchQueue(label: "my queue")
    queue.sync {
        print("work as sync means higher priority of execution")
    }
}
// deadLockSituationWillNotHappen() //work as sync means higher priority of execution

func deadLockSituationWillHappen(){
    let queue = DispatchQueue(label: "my queue")
    queue.sync {
        print("step1 is woorked only")
        queue.sync {
            print("will not work, waiting for execution, both blocks are waiting for each other to execute, leads a deadlock")
        }
        print("step2 is also woorked")
    }
}

// deadLockSituationWillHappen() // step1 is woorked only
