import UIKit

//longest substring without repeating characters.
//Input: s = "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.

/*
func findLongestSubstring (input : String) {
    var hash_map = [ Character : Int]()
    for ch  in input {
        if let _ = hash_map[ch] {
          // do nothing
        } else {
            hash_map[ch] = 1
        }
    }
    print( String(hash_map.keys))
}

findLongestSubstring(input: "abcabcbb")
*/

func SerialQueueWithSyn(){
    let serialQueue = DispatchQueue(label: "com.test.com")

    serialQueue.sync {
        print("task 1 started")
        for i in 0...5{
            print("task 1 with \(i)")
        }
        print("task 1 finished")
    }
    serialQueue.sync {
        print("task 2 started")
        for i in 0...5{
            print("task 2 with \(i)")
        }
        print("task 2 finished")
    }
    serialQueue.sync {
        print("task 3 started")
        for i in 0...5{
            print("task 3 with \(i)")
        }
        print("task 3 finished")
    }
}

SerialQueueWithSyn()
