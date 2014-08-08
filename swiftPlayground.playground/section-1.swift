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
shoppingList = [] // went shopping and bought everyTHING!! (empty array)

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
greett("Fero", "salad and scrambled eggs") // <-- experiment

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
averageOf(4,5,6) // <-- experiment

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
    } // <-- experiment
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
    } // <-- experiment
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
circle.simpleDescription() // <-- experiment

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

class Counter{
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount*times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

// optional values -->

let optionalSquare: Square? = Square(sideLenght: 2.5, name: "optional square")
let sideLenght = optionalSquare?.sideLenght

/// ENUMERATIONS AND STRUCTURES --->

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.toRaw())
        }
    }
    
    func compareTwoRanksByRaw(rankOne: String, rankTwo: String) -> String { // experiment -->
        if rankOne > rankTwo {
            return "\(rankOne) is bigger than \(rankTwo)."
        } else {
            return "\(rankTwo) is bigger than \(rankOne)."
        }
    }
}

let ace = Rank.Ace
let aceRawValue = ace.toRaw()

var biggerValue = Rank.Ace.compareTwoRanksByRaw("\(Rank.Ace.toRaw())", rankTwo: "\(Rank.Three.toRaw())") // <-- experiment

if let convertedRank = Rank.fromRaw(9) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String { // experiment -->
        switch self {
        case .Hearts:
            return "red"
        case .Diamonds:
            return "red"
        default:
            return "black"
        }
    }
}
let hearts = Suit.Hearts
let clubs = Suit.Clubs
let heartsDescription = hearts.simpleDescription()
let clubsDescription = clubs.simpleDescription()

hearts.color() // <-- experiment
clubs.color()  // <-- experiment

// Struct..

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func createDeck() -> String { // experiment (O.M.G. this literally took me ages.) - I'm sure it can be done much easier way but I just don't care now, if you have better idea send me an email..) -->
        var deck: String = ""
        var s = 1
        var i = 1
        while s < 5 {
            if s == 1 {
                while i < 14 {
                    var card = Card(rank: Rank.fromRaw(i)!, suit: Suit.Clubs)
                    deck += " \(card.simpleDescription()),"
                    i++
                }
            } else if s == 2 {
                while i < 14 {
                    var card = Card(rank: Rank.fromRaw(i)!, suit: Suit.Spades)
                    deck += " \(card.simpleDescription()),"
                    i++
                }
            } else if s == 3 {
                while i < 14 {
                    var card = Card(rank: Rank.fromRaw(i)!, suit: Suit.Diamonds)
                    deck += " \(card.simpleDescription()),"
                    i++
                }
            } else if s == 4 {
                while i < 14 {
                    var card = Card(rank: Rank.fromRaw(i)!, suit: Suit.Hearts)
                    deck += " \(card.simpleDescription()),"
                    i++
                }
            }
            s += 1
            i=1
        }
        return deck
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

var deck = threeOfSpades.createDeck() // <-- experiment

enum ServerResponse {
    case Result(String, String)
    case Error(String)
    case RequestDaysInMonth(Int)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)."
case let .RequestDaysInMonth(days):
    let serverResponse = "The number of days in this month is \(days)."
}

/// PROTOCOLS and EXTENSIONS --->

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple description."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust()  {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

enum SimpleEnum: ExampleProtocol { // experiment -->
    case  Base, Adjusted
    
    var simpleDescription: String {
    get {
        return self.getDescription()
        }
    }
    
    func getDescription() -> String {
        switch self {
        case .Base:
            return "A simple enum"
        case .Adjusted:
            return "Adjusted simple enum"
        }
    }
    mutating func adjust() {
        self = SimpleEnum.Adjusted
    }
    
}
var c = SimpleEnum.Base
c.adjust()
let cDescription = c.simpleDescription // <-- experiment

// Extension -->

extension Int: ExampleProtocol {
    var simpleDescription: String {
    return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

extension Double: ExampleProtocol { // experiment -->
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    var absoluteValue: String {
        if self < 0 {
            return "The absolute value of \(self) is \(self*(-1))"
        } else {
            return "The absolute value is \(self)"
        }
    }
    
    mutating func adjust() {
        self += 42.6
    }
}
7.86.simpleDescription
(-3.54).absoluteValue // <-- experiment

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
// protocolValue.anotherProperty // uncomment to see the error

// GENERICS --->

func repeat<ItemType>(item: ItemType, times: Int) -> ItemType[] {
    var result = ItemType[]()
    for i in 0..times {
        result += item
    }
    return result
}
repeat("knock", 5)

// Reimplement the Swift standard library's optional type

enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Array<T.GeneratorType.Element> { // experiment -->
    var ar: T.GeneratorType.Element[] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                ar.append(rhsItem)
            }
        }
    }
    return ar // <-- experiment
}

anyCommonElements([2,3,4,5,7], [3,4,5,6,7,8])


/// LANGUAGE GUIDE --->

var x = 3, y = 5, z = 7 //  you can declare multiple vars/constants on a single line using commas

let pi = 3.14159

// some optionals

let possibleNumber = "123"
let convertedNumber = possibleNumber.toInt()

if convertedNumber {
    println("\(possibleNumber) has an integer value of \(convertedNumber!)") // doesnt print
} else {
    println("\(possibleNumber) couldnt be converted to an integer.") // doesnt print
}

// optional binding

if let actualNumber = possibleNumber.toInt() {
    println("\(possibleNumber) has an integer value of \(actualNumber)") // doesnt print
} else {
    println("\(possibleNumber) couldnt be converted to an integer") // doesnt print
}

// nil

var serverResponseCode: Int? = 404 // whats this "some" doing here?
serverResponseCode = nil

var surveyAnswer: String? // automatically set to nil

let possibleString: String? = "An optional string."
println(possibleString!) // doesnt print

let assumedString: String! = "An implicitly unwraped optional string."

// doesnt print

println(assumedString)

if assumedString {
    println(assumedString) // doesnt print
}

if let definiteString = assumedString {
    println(definiteString) // doesnt print
}

/* dunno why it doesnt print */

// Assertions -->

let age = -3
/* assert(age >= 0, "A persons age cannot be less than zero.") */ // this stops console output, etc... (whole playground)

/* can be written aswell as "assert(age >= 0)" */

// doesnt print

/// Basic Operators -->

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20) // ternary operator (3)

// Range operators

//closed range operator

for index in 0...5 {
    println("\(index) times five is \(index*5).") //shows in assistant editor but not in playground :/ // doesnt print
}

// half closed range operator

let names = ["Anna", "Mike", "Fero", "Pluto"]
let count = names.count

for i in 0..count {
    println("Person number \(i + 1) is called \(names[i]).") // doesnt print
}

// String and Characters --->

var emptyString = ""

if emptyString.isEmpty {
    println("Nothing to see here") // doesnt print
}

for character in "Doggieee!" {
    println(character)  // doesnt print
}

let yenSign: Character = "¥"

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
println("UnusualMenagerie has \(countElements(unusualMenagerie)) characters.")

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

// has preffix

var act1SceneCount = 0

for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}

println("There are \(act1SceneCount) scenes in act one.")

// has suffix

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}

println("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

// uppercase/lowercase String

let normal = "Could you help me, please?"

let shouty = normal.uppercaseString
let whisper = normal.lowercaseString

/// Unicode --->

let dogString = "Dog!🐶"

// UTF8 ->

for codeUnit in dogString.utf8 {
    println("\(codeUnit) ")
}

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}
print("\n")

// UTF16 ->

for codeUnit in dogString.utf16 {
    println("\(codeUnit) ")
}

// Unicode Scalars ->

for scalar in dogString.unicodeScalars {
    print("\(scalar.value)")
}
print("\n")

for scalar in dogString.unicodeScalars {
    println("\(scalar)")
}
// supposed to  print D O G ! 🐶 etc... u get it..

/// COLLECTION TYPES --->

// Arrays -->

var shoppinggList: String[] = [ "eggs", "coffe", "milk"]

shoppinggList.append( "flour")
// or
shoppinggList += "baking powder"
shoppinggList += ["meat", "chilli", "snails"]

var firstItem = shoppinggList[0]

shoppinggList[0] = "six eggs"

shoppinggList[4...6] = ["Nothing"]

// inserting 

shoppinggList.insert("Maple Sirup", atIndex: 5)

let mapleSirup = shoppinggList.removeAtIndex(5)

let myLastItem = shoppinggList.removeLast() // u can remove last item using this function if not in knowledge of exact number of items in array

// Iterating over an array ->

for item in shoppinggList {
    println(item)
}

// or use enumerate function

for (index, value) in enumerate(shoppinggList) {
    println("Item\(index+1): \(value)")
}

// Creating and initializing an array

var someInts = Int[]()
println("someInts is of type Int[] with \(someInts.count) items.")



















































































