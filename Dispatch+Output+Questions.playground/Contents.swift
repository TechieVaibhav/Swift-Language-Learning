import UIKit

/*
 
 Summary

 DispatchQueue : An object that manages the execution of tasks serially or concurrently on your app's main thread or on a background thread.
 
 Declaration As
 class DispatchQueue : DispatchObject
 
 NOTE : Dispatch queues are FIFO queues to which your application can submit tasks in the form of block objects.
 
 Sync means high priority.
 
 */


func guessTheOutputWithDispatch() {
    print("step 1")
    DispatchQueue.main.async {
        print("step 2")
    }
    print("step 3")
}
//guessTheOutputWithDispatch()
//OutPut :
/*
step 1
step 3
step 2
*/


func guessTheOutput2WithDispatch() {
    print("step 1")
    DispatchQueue.main.sync {
        print("step 2")
    }
    print("step 3")
}

//guessTheOutput2WithDispatch()

/* OutPut :
Error: compiler throws Execution was interrupted, reason: EXC_BAD_INSTRUCTION
So here we are access the Main-Thread and force to run synchronously, it will results as deadlock.
 
Note:  only "step 1" is print, sync means we want to perform opertions/task in synchronous way.
 
 */

func guessTheOutput3WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        print("step 2")
    }
    print("step 3")
    print("step 4")
}

//guessTheOutput3WithDispatch()

// output :- step 1,step 3, step 4, step 2
// Note:-

/*
 basically we are queued this operation, it will call in last when main thread is free from current function/block, i mean when all other task is finished it will take call at last.
 
DispatchQueue.main.async {
    print("step 2")
}
 */

func guessTheOutput4WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        print("step 2")
    }
    DispatchQueue.main.async {
        print("step 3")
    }
    print("step 4")
    print("step 5")
}
//guessTheOutput4WithDispatch()
// output :- 1 , 4, 5, 2, 3


func guessTheOutput5WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        print("step 2")
        DispatchQueue.main.async {
            print("step 3")
        }
    }
    print("step 4")
    print("step 5")
}
//guessTheOutput5WithDispatch()
/* Hint : cut the scope as a function to simplyfy the statement
print("step 2")
DispatchQueue.main.async {
    print("step 3")
}
*/

// output :- 1 , 4, 5,2,3



func guessTheOutput6WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        print("step 2")
        DispatchQueue.main.async {
            print("step 3")
        }
        DispatchQueue.main.async {
            print("step 4")
        }
        DispatchQueue.main.async {
            print("step 5")
        }
    }
    print("step 6")
    print("step 7")
}

//guessTheOutput6WithDispatch()

// output :- 1 ,6,7, 2,3,4,5


func guessTheOutput7WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        print("step 2")
        DispatchQueue.main.async {
            print("step 3")
        }
        DispatchQueue.main.sync {
            print("step 4")
        }
        DispatchQueue.main.async {
            print("step 5")
        }
    }
    print("step 6")
    print("step 7")
}

//guessTheOutput7WithDispatch()

// output :- 1 ,6,7, 2

func guessTheOutput8WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        DispatchQueue.main.sync {
            print("step 2")
        }
        DispatchQueue.main.async {
            print("step 3")
        }
    }
    print("step 4")
    print("step 5")
}
guessTheOutput8WithDispatch()
// output :- 1 ,4 , 5



func guessTheOutput9WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        DispatchQueue.main.async {
            print("step 2")
            DispatchQueue.main.async {
                print("step 3")
            }
        }
        DispatchQueue.main.async {
            print("step 4")
        }
    }
    print("step 5")
    print("step 6")
}
//guessTheOutput9WithDispatch()

/* Hint : cut complex statement part to make it simple:
 DispatchQueue.main.async {
     print("step 2")
     DispatchQueue.main.async {
         print("step 3")
     }
 }
 DispatchQueue.main.async {
     print("step 3")
 }
 
 */
// output :- 1, 5, 6, 2, 4, 3


func guessTheOutput10WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        DispatchQueue.main.async {
            for i in 0...10 {
                print("nested step \(i)XXXXXX")
            }
            print("step 2")
            DispatchQueue.main.async {
                print("step 3")
            }
        }
        DispatchQueue.main.async {
            print("step 4")
        }
    }
    print("step 5")
    print("step 6")
}
//guessTheOutput10WithDispatch()

// OUTPUT :
/*
 step 1
 step 5
 step 6
 nested step 0XXXXXX
 nested step 1XXXXXX
 nested step 2XXXXXX
 nested step 3XXXXXX
 nested step 4XXXXXX
 nested step 5XXXXXX
 nested step 6XXXXXX
 nested step 7XXXXXX
 nested step 8XXXXXX
 nested step 9XXXXXX
 nested step 10XXXXXX
 step 2
 step 4
 step 3

*/

func guessTheOutput11WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        DispatchQueue.main.async {
            DispatchQueue.main.async {
                print("step 2")
            }
            for i in 0...10 {
                print("nested step \(i)XXXXXX")
            }
            print("step 3")
            DispatchQueue.main.async {
                print("step 4")
            }
        }
        DispatchQueue.main.async {
            print("step 5")
        }
        DispatchQueue.main.async {
            print("step 6")
        }
    }
    print("step 7")
    print("step 8")
}

guessTheOutput11WithDispatch()

/* cut for make logic
 DispatchQueue.main.async {
     DispatchQueue.main.async {
         print("step 2")
     }
     for i in 0...10 {
         print("nested step \(i)XXXXXX")
     }
     print("step 3")
     DispatchQueue.main.async {
         print("step 4")
     }
 }
 DispatchQueue.main.async {
     print("step 5")
 }
 DispatchQueue.main.async {
     print("step 6")
 }
 */


// OUTPUT :
/*
 step 1
 step 7
 step 8
 
 nested step 0XXXXXX
 nested step 1XXXXXX
 nested step 2XXXXXX
 nested step 3XXXXXX
 nested step 4XXXXXX
 nested step 5XXXXXX
 nested step 6XXXXXX
 nested step 7XXXXXX
 nested step 8XXXXXX
 nested step 9XXXXXX
 nested step 10XXXXXX
 step 3
 
 step 5
 step 6
 
 step 2
 step 4

*/


func guessTheOutput12WithDispatch() {
    print("step 1")
    //basically we are queued this operation
    DispatchQueue.main.async {
        DispatchQueue.main.async {
            DispatchQueue.main.async {
                print("step 2")
            }
            for i in 0...10 {
                print("nested step \(i)XXXXXX")
            }
            print("step 3")
            DispatchQueue.main.async {
                print("step 4")
            }
        }
        DispatchQueue.main.async {
            print("step 5")
        }
        DispatchQueue.main.async {
            print("step 6")
        }
    }
    print("step 7")
    print("step 8")
}
guessTheOutput12WithDispatch()
