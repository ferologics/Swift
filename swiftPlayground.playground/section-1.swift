// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground. This is code reference for iBook ''The Swift Programming Language'' "

/// SIMPLE VALUES --->

var myVariable = 42
myVariable = 50
let myConstant = 20

let implicitInteger = 70
let implicitDouble = 70.0
let explixitDouble: Double = 68
let explicitFloat: Float = 4

let label = "The Width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let orangesSummary = "I have \(oranges) oranges"
let fruitSummary = orangesSummary + " & " + appleSummary

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = ["Malcolm": "Captain", "Kaylee": "Mechanic"]
occupations["Jayne"] = "Public Relations"

let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()
shoppingList = [] //went shopping and bought everyTHING!! (empty array)

/// CONTROL FLOW --->

let individualScores = [75,43,103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 3
    }
}
teamScore

// optional values --->

var optionalString: String? = "Hello"
optionalString = nil

var optionalName: String? = "John Applesed"
optionalName = nil
var greeting = "Hello"
if let name = optionalName {
    greeting = "Hello, \(name)!"
} else {
    greeting = "Hello, no Name man!"
}

// SWITCH lines --->

let vegetable = "red pepper"
switch vegetable {
    
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log"
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich"
case let x where
    x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}       // when no default displays error "switch must be exhaustive"

// FOR IN lines --->

let interestingNumbers = ["Prime": [2,3,5,7,11,13,17], "Fibonacci": [1,1,2,3,5,8,13], "Square": [1,4,9,16,25,49]]
var largest = 0
var expVar = "" // experiment..

for(kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            expVar = "Largest is number \(largest) in \(kind) kind" // experiment..
        }
    }
}
largest
expVar // experiment..

// WHILE lines --->

var n = 2
while  n < 100 {
    n *= 2
}
n

var m = 2
do {
    m *= 2
} while m < 100
m
// alternative style --->
var firstLoop = 0
for i in 0..3 { // use .. to make range that omits its upper value, and use ... to make range that includes both values!!! :D
    firstLoop += i
}
firstLoop

var secondLoop = 0
for var i = 0; i < 3; i++ {
    secondLoop += i
}
secondLoop

/// FUNCTIONS and CLOSURES --->

func greet(name: String,day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Fero", "Tuesday")

func greett(name: String,lunchSpecial: String) -> String { // experiment -->
    return "Hello \(name), today is served \(lunchSpecial) as lunch special."
}
greett("Fero", "salad and scrambled eggs")

// tuple (multiple return...) --->

func getGasPrices() -> (Double, Double, Double) {
    return(3.59, 3.69, 3.79)
}
getGasPrices()

func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(42, 597, 12)

func averageOf(numbers: Int...) -> Int { // experiment -->
    var average = 0
    var numOfVal = 0
    var sum = 0
    for number in numbers {
        sum += number
        numOfVal++
    }
    average = sum / numOfVal
    return average
}
averageOf(4,5,6)

// Nested Functions --->

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// a function can return a function!

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7) // pretty neat HUH?

// a function can take another function as one of its arguments!

func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen) // developers at apple just dont know what else to do so they make these fancy features meh...

numbers.map ({
    (number: Int) -> Int in
    let result = 3 * number
    if result % 2 == 0 { // experiment -->
        return result
    } else {
        return 0
    }
})

numbers.map({ number in 3 * number})

sort([1, 5, 3, 12, 2]) { $0 > $1 }

/// OBJECTS and CLASSES --->

class NamedShape {
    var numberOfSides = 0
    var name = "cube"
    init(numberOfSides: Int, name: String) {
        self.numberOfSides = numberOfSides
        self.name = name
    }
    func simpleDescription() -> String {
        return "A \(name) with \(numberOfSides) sides."
    }
    func toSecondPower(value: Int) -> Int { // experiment -->
        return value*value
    }
}

var shape = NamedShape(numberOfSides: 6, name: "cube")
shape.simpleDescription()

class Square:NamedShape {
    var sideLenght: Double
    
    init(sideLenght: Double, name: String) {
        self.sideLenght = sideLenght
        super.init(numberOfSides: 4, name: name)
    }
    
    func area() -> Double {
        return  sideLenght*sideLenght
    }

    override func simpleDescription() -> String {
        return "A \(name) with sides of lenght \(sideLenght)"
    }
}

let test = Square(sideLenght: 5.2, name: "test square")
test.area()
test.simpleDescription()

class Circle:NamedShape { // experiment -->
    var radius: Double
    var pi: Double = (355 / 113)
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(numberOfSides: 0, name: name)
    }
    
    func area() -> Double {
        return (2 * pi * radius)
    }
    
    override func simpleDescription() -> String {
        return "A \(name) with radius of \(radius)"
    }
}

let circle = Circle(radius: 5.63, name: "circle")
circle.area()
circle.simpleDescription()
// getters and setters

class EquilateralTriangle: NamedShape {
    var sideLenght: Double = 0.0
    
    init(sideLenght: Double, name: String) {
        self.sideLenght = sideLenght
        super.init(numberOfSides: 3, name: name)
    }
    
    var perimeter: Double {
    get {
        return 3.0 * sideLenght
    }
    set {
        sideLenght = newValue/3.0
    }
    }
    
    override func simpleDescription() -> String {
        return "An \(name) with sides of lenght \(sideLenght)."
    }
}

let equilateralTriangle = EquilateralTriangle(sideLenght: 3.5, name: "equilateral triangle")
equilateralTriangle.perimeter
equilateralTriangle.perimeter = 9.9
equilateralTriangle.sideLenght
// will set

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
    
    willSet {
        square.sideLenght = newValue.sideLenght
    }
    }
    var square: Square {
    
    willSet {
        triangle.sideLenght = newValue.sideLenght
    }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLenght: size, name: name)
        triangle = EquilateralTriangle(sideLenght: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another testshape")
triangleAndSquare.square.sideLenght
triangleAndSquare.triangle.sideLenght
triangleAndSquare.square = Square(sideLenght: 50, name: "larger square")
triangleAndSquare.triangle.sideLenght






















































