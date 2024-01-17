import Foundation

class Animal {
    var name: String
    init(n: String) {
        name = n
    }
}
class Human: Animal {
    func code() {
        print("Typing away... ")
    }
}
class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under water.")
    }
}

let angela = Human(n: "Baris dag")
let jack = Human(n: "jack me")
let nemo = Fish(n: "Nemo")

let neighbours = [angela, jack, nemo]
func findNemo (from animals: [Animal]) { 
    for animal in animals {
        if animal is Fish {
    print (animal.name)
    let fish = animal as! Fish //Forced downcast
             fish.breatheUnderWater()
            
            
    let animalFish = fish as Animal //Upcasting  !? koyman gerek yok
            
        }
    }
}
findNemo(from: neighbours)
if let fish = neighbours [1] as? Fish { fish.breatheUnderWater()
} else {
    print("Casting has failed")
}

