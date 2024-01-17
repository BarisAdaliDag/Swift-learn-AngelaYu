import Foundation
//
////MARK: - Computed Properties
//
//let pizzaInInches: Int = 12
//var numberOfPeaople : Int = 6
//let slicesPerPerson : Int = 5
//var numberOfSlices: Int {
//    
//    get {  // get var set yoksa read only
//        return pizzaInInches
//    }
//    set {
//        
//        print("number slices now has \(newValue)") // newValue = numberOfSlices
//    }
//    
//   
//}
//
//var numberOfPizza: Int {
//    get {
//        let numberOfPeopleFedPizza = numberOfSlices / slicesPerPerson
//        return numberOfPeaople / numberOfPeopleFedPizza
//    }
//    // pizzamiz var kac kisi cagirabiliriz
//    set {
//        let totalSlices = numberOfSlices * newValue
//        numberOfPeaople = totalSlices / slicesPerPerson
//        
//    }
//}
//print ("numberOfSlices")
//
//print (numberOfSlices)
//
//numberOfSlices = 12
//print ("numberOfPizza")
//print (numberOfPizza)
//
//numberOfPizza = 6
//print ("numberOfPeaople")
//
//print (numberOfPeaople)
//
////MARK: - Observer Properties
//
//var hamurboyut: Int = 10 {
//    
//    willSet{
//        print("veri degismeden onceki hali tetiklendi ")
////        print(newValue)
//        print(hamurboyut)
//    }
//    didSet{
//        print(oldValue)
//        print(hamurboyut)
//
//        if hamurboyut > 18 {
//            print("hamur boyutu gecerli boyutun uzerinde")
//            
//            hamurboyut = 18
//        }
//        
//    }
//}
//hamurboyut = 40
//print(hamurboyut)


//MARK: - change


var width: Float = 3.4 
var height: Float = 2.1
var bucketsOfPaint: Int {
    get {
        
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedBuckets = ceilf (numberOfBuckets)
        return Int(roundedBuckets)
    }
    
    set {
        
        let areaCanCover = Double(newValue) * 1.5
        print("This amount of paint can cover an area of \(areaCanCover)")
    }
}
bucketsOfPaint = 8
