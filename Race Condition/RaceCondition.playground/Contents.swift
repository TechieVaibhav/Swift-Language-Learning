import UIKit


class Counter{

    var arr = ["iphone 13", "samsung", "vivo"]

    func purchase(productname : String) {
        guard let index = arr.firstIndex(of: productname) else { return}
        arr.remove(at: index)
        print("congratulations for purchasing...")
    }

    func getAvailableProductList(){
        print(" all list \(arr)")
    }
}
let counter = Counter()

let queue = DispatchQueue(label: "Environment",attributes: .concurrent)
queue.async {
    counter.purchase(productname: "iphone 13")
}
queue.async {
   counter.getAvailableProductList()
}

