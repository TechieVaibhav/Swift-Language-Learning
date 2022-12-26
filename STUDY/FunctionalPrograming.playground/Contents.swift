import UIKit

//Functional Programming :-
// in general, to write the less code and to follow the code standards, we mapped our code with functions.

// Non function Programming:-
//VC1
let array = [1, 2, 3, 4]
 var sum = 0
for obj in array {
    sum += obj
}
print(sum)

// now if i want to achive the same functionality to another class , then i have to follow the code same again, and we can write by copy and paste
//VC 2
let array2 = [1, 2, 3, 4]
 var sum2 = 0
for obj in array2 {
    sum2 += obj
}
print(sum2)


// we can write this code into a function
func addition () -> Int {
    let array2 = [1, 2, 3, 4]
     var sum2 = 0
    for obj in array2 {
        sum2 += obj
    }
   return sum2
}

//... VC1
addition()


//... VC2
addition()
