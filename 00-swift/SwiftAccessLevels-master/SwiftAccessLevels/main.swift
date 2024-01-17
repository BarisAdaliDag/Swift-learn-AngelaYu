//
//  main.swift
//  SwiftAccessLevels
//
//  Created by Angela Yu on 14/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

let aClass = AClass()



let bClass = AnotherClassInAnotherFile()

bClass.aClass.anInternalProperty = "adana"

aClass.anInternalProperty = bClass.aClass.anInternalProperty 

print(aClass.anInternalProperty)


