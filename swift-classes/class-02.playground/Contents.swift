import Foundation

// Enum

enum Compass {
    case north
    case south
    case east
    case west
}

var heading: Compass = .north
heading = .south

print(heading)

switch heading {
case .north:
    print("Going to north")
case .south:
    print("Going to south")
case .east:
    print("Going to east")
case .west:
    print("Going to west")
}

enum Month {
    case january, february, march, april, may, june
}

enum WeekDay: String {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday = "sábado"
    case sunday = "domingo"
}
let today: WeekDay = .saturday

print("Hoje é", today.rawValue)

let tomorrow = WeekDay(rawValue: "domingo") // ?.rawValue

// Associated value

enum Measure {
    case weight(Double)
    case age(Int)
    case size(width: Double, height: Double)
}

let measure = Measure.size(width: 15, height: 25)
print(measure)

switch measure {
case .weight(let weight):
    print("Medida de peso, e o peso é: \(weight)")
case .age(let age):
    print("Medida de idade, e a idade é: \(age)")
case .size(let width, let height):
    print("Medida de tamanho: Comprimento: \(width), Altura: \(height)")
}



// Functions or Methods
func printSomething() {
    print("something")
}
printSomething()

func sayHello(to name: String) -> String {
    return "Hello, \(name)!"
}
sayHello(to: "You")

func double(x: Int) -> Int {
    return x*2
}
double(x: 8)

//func sum(a: Int, b: Int) -> Int {
//    return a+b
//}
//sum(a: 5, b: 3)

// first version
func say(greetings: String, person: String) {
    print("\(greetings) \(person)")
}
say(greetings:"Olá" , person: "Pedro")

// second version (improving legibility)
func sayA(_ greetings: String, to: String) {
    print("\(greetings) \(to)")
}
sayA("Olá" , to: "Pedro")

// third version (improving legibility)
// internal name is different to external name (to and person)
func sayB(_ greetings: String, to person: String) {
    print("\(greetings) \(person)")
}
sayB("Olá" , to: "Pedro")


func sum(_ number1: Int, _ number2: Int) -> Int {
    return number1+number2
}
func subtract(_ number1: Int, _ number2: Int) -> Int {
    return number1-number2
}
func multiply(_ number1: Int, _ number2: Int) -> Int {
    return number1*number2
}
func divide(_ number1: Int, _ number2: Int) -> Int {
    return number1/number2
}

// version 1
func calculate(_ number1: Int, _ number2: Int, using operation: (Int, Int) -> Int) -> Int {
    return operation(number1, number2)
}
calculate(7, 5, using: subtract)

// version 2
typealias Operation = (Int, Int) -> Int
func calculateA(_ number1: Int, _ number2: Int, using operation: Operation) -> Int {
    return operation(number1, number2)
}
calculateA(7, 5, using: subtract)

// version 3
func getOperation(named: String) -> Operation {
    switch named {
    case "sum":
        return sum
    case "subtract":
        return subtract
    case "division":
        return divide
    default:
        return multiply
    }
}

let newOperation = getOperation(named: "sum")
newOperation(5,4)
getOperation(named: "sum")(5,4)


// Closures
/**
 {(parameter: Type) -> ReturnType in
    code here
 }
 
 func name(parameter: Type) -> ReturnType {
    code here
 }
*/

// version 1
calculate(8, 3, using: {(x: Int, y: Int) -> Int in
    return x % y
 })

// version 2 - simplifying closure
calculate(8, 3, using: {(x, y) -> Int in
    return x % y
 })

// version 3 - simplifying closure
calculate(8, 3, using: {(x, y) in
    return x % y
 })

// version 4 - simplifying closure
calculate(8, 3, using: { x, y in
    return x % y
 })

// version 5 - simplifying closure
calculate(8, 3, using: {
    return $0 % $1
 })

// version 6 - simplifying closure
calculate(8, 3, using: { $0 % $1 })

// version 7 - simplifying closure
calculate(8, 3) { $0 % $1 }

let names = ["Gal", "Eran", "Shai"]

var upperCasedNames: [String] = []
for name in names {
    upperCasedNames.append(name.uppercased())
}
print(upperCasedNames)

// using closure
print(names.map { $0.uppercased()})


//------------------------------------------------
// Classes vs Structs

// Struct: Value type
struct PersonAsStruct {
    let name: String
    var age: Int
    
    // memberwise initializer -> doesnt need constructor
}
var felipeA = PersonAsStruct(name: "Felipe", age: 45)
var pauloA = felipeA
felipeA.age = 49
print(pauloA.age) // prints 45 -> Struct: Value type


// Class: Reference type
class PersonAsClass {
    // propriedades armarenadas
    let name: String
    var age: Int
    weak var friend: PersonAsClass?
    
    // propriedades computadas
    var bio: String {
        "\(name), \(age) anos"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    deinit {
        print("\(name) morreu")
    }
}
var felipeB = PersonAsClass(name: "Felipe", age: 45)
var pauloB = felipeB
felipeB.age = 49
print(pauloB.age) // prints 45 -> Struct: Value type | Class: Reference type


var mario: PersonAsClass? = PersonAsClass(name: "Mario", age: 45)
var fabio: PersonAsClass? = PersonAsClass(name: "Fabio", age: 45)


// mario = nil // deinit -> ARC -> logs "Mario morreu"
// fabio = nil // deinit -> ARC -> logs "Fabio morreu"
// ARC: Automatic Reference Count

mario?.friend = fabio
fabio?.friend = mario

mario = nil // now Mario não morreu -> Memory Leak
fabio = nil // now Fabio não morreu -> Memory Leak

// cycle reference - caution!
// referência cíclica: quando um objeto se referencia a outro objeto e o outro objeto se referencia a esse um

// how to solve: weak var friend: PersonAsClass?
// weak


// Extension
var name = "Fernando Pessoa"

var jose: PersonAsClass? = PersonAsClass(name: "Jose", age: 45)
jose?.bio // extension in class // computed value
jose?.age = 47
jose?.bio

extension String {
    var initials: String {
        self.capitalized
            .components(separatedBy: " ")
            .map{ String($0.first ?? Character("")) }
            .joined()
    }
}

name.initials


// Protocols
class Animal {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

protocol Runner {
    var speed: Double { get set }
    func run()
}

extension Runner {
    func run() {
        print("running...")
    }
}

class Dog: Animal, Runner {
    var speed: Double = 0.0
    
    func run() {
        print("running as a dog ...")
    }
    
    func bark() {
        print("au au")
    }
}

var billy = Dog(name: "Billy", age: 19)
billy.bark()
billy.run()
