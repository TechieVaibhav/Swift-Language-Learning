import UIKit




//[i] > [i+1]
//0 > 1 => swap(first ,second)
//1 > 0 =>  [0,1,0,1,1,1,0] / i = 1, i+1 = 2 { [0,0,1,1,1,1,0]  }
//
//1 > 1 =>  [0,1,0,1,1,1,0] / i = 2, i+1 = 3 { [0,0,1,1,1,1,0]  }


/*
func solution(){
    var problem = [1,0,0,1,1,1,0]
    let arrLen = problem.count
    
    for i in 0...arrLen - 1{
        let item1 = problem[i]
        for j in (i+1)..<arrLen {
            
            if item1 > problem[j] {
                problem = swapArray(arr: &problem, index1: i, index2: j)
                print("index i : \(i), index j : \(j), problrm \(problem)")
            }
        }
    }
    print("problem : \(problem)")
}

func swapArray(arr : inout [Int], index1 : Int, index2 : Int ) -> [Int] {
    let temp = arr[index1]
    arr[index1] = arr[index2]
    arr[index2] = temp
    return arr
}
solution()
*/
// time 0(n^2)

func optSolution(){
    var problem = [1,0,1,0,1]
    var leftPointer = 0
    var rightPointer = problem.count - 1
    
    while leftPointer < rightPointer{
        
        if problem[leftPointer] > problem[rightPointer] {
            problem = swapArray(arr: &problem, index1: leftPointer, index2: rightPointer)
            print("leftPointer  : \(leftPointer), rightPointer  : \(rightPointer), problrm \(problem)")
            leftPointer += 1
        } else {
//            problem = swapArray(arr: &problem, index1: leftPointer, index2: rightPointer)
//            print("leftPointer  : \(leftPointer), rightPointer  : \(rightPointer), problrm \(problem)")
            rightPointer -= 1
        }
    }
    print("problem : \(problem)")
}

func swapArray(arr : inout [Int], index1 : Int, index2 : Int ) -> [Int] {
    let temp = arr[index1]
    arr[index1] = arr[index2]
    arr[index2] = temp
    return arr
}

optSolution()
// if we have only 2 digits , then O(n) is possible.



//A[n] - 0(n) sort
// quickSort -- nlogn
// mergeSort -- nlogn



func optSolution2(){
    let problem = [0,0,1,1,0]
    
    var count0 = 0
    var count1 = 0
    
    for i in 0..<problem.count {
        if problem[i] == 0 {
            count0 += 1
        }
        
    }
    print("count0 \(count0)")
    count1 = problem.count - count0
    
    var finaly = [Int]()
    var mainIndex = 0
    for _ in 0..<count0 {
        finaly.insert(0, at: mainIndex)
        mainIndex += 1
    }
    for _ in 0..<count1 {
        finaly.insert(1, at: mainIndex)
        mainIndex += 1
    }
    print("finaly : \(finaly)")
}

optSolution2()
