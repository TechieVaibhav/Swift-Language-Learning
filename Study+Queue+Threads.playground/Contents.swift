import UIKit



// Thread : a smallest processing unit.
// MultiThread : multiple threads are available. so when you want to execute your task , then you required a thread, when you are in multhreading environment , that meant you can achieved the excution of task in concurrent way.
// Advantages of Multithreading : Fast Execution, reponsive, resource utilization.

// Fast Execution :

// Queue: when you done work with thread, then it is done by creating a DispatchQueue, in ios every task puts into Queue, queue follows FIFO pattern to execute their task. Queue required threads and thread is provided by OS.
// So when your iOS app is lanuched, then OS will provide you a thread for your task execution, that is called the main thread, that is accessed by DispatchQueue.main. when  we want to perform UI related task then we access the main thread like DispatchQueue.main.
// in iOS, When you create a `Dispatch Queue`, then OS will assign and create one/more thread for this queue, this is totally depend upon your OS Cores(dual core/single core). OS can also use the existing thread, this is totally depends upon OS level.

/*************************************/

// So when you create your concurrent queue , apple offers you QOS to make your task interactive.

//QOS : Quality Of Services, in iOS we have 6 types of QOS:

//1. User interactive : like when we are doing such UI animation or small calcultion, and we can the result in some few seconds, then we can use the user interactive service.if result takes time then app could be freeze.

// 2. User initiated: on immediates bases when you want the result, like uper kicks off the button to open the existing PDF Docs, i meant the request is intitaed by user without user waiting.

// Note : for faster result used the User initiated.

// 3. Utility: for long runing task, we re using utility, like we are doing the Api call, which takes time, you can use the indictor here till service result.

// 4. background: when you want to do something without knowing the user, then you can use background service, like user scroll the list to get the new record , and in background we hit the request to get more data.

// 5. default 6.unspecified : generally we avoid the uses of `default` & `unspecified`. `default` is falls between `User initiated`  & `Utility` . `unspecified` is used to supports the lagacy Api that opt the thread out of qualty of service.this is not recommended to directly used.

// Queue with Global : So if don't want to use your own queue , then you can use the pre-define global queue.which work as `concurent queue`.

// Note : UI always update with main thread, and other app logic/calculation will go with QOS.

// Note : Dispatch can also having the another dispatch(nested dispatch).

// Note : DispatchQueue.qlobal means global queue which is concurrent, first-in first-out.


// Adding Task to Queue:






