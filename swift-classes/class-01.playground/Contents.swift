import UIKit

// REPL: Read Eval Proccess Loop

// cmd+option+/ -> creates documentarion

/// Method for http request
/// - Parameters:
///   - url: URL that contains the endpoint to be consumed
///   - method: Request HTTP method (GET, POST, PUT, etc)
///   - parameter: Dictionary that contains the param list to be sent in body request
///   - header: Dictionary that contains the header list in request
func request(_ url: URL,
             method: String = "GET",
             parameter: [String: Any]? = nil,
             header: [String: Any]? = nil) {}

// Variables
var accountValue = 2000000.0
accountValue = 300000.0 // ok

var x = 22, y = 12, z = -9

let cpf = "092.023.230-03"
// cpf = "123" -> not ok
// Cannot assign to value: 'cpf' is a 'let' constant


// PascalCase (Classes)
// camel_case (objects, mothods)

class Person {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let gabriel = Person(name: "Gabriel Barth", age: 26)
gabriel.age = 27 // can update
// gabriel = Person(name: "Outro", age: 20) cant update


// Types
// Int, String, Bool, Double, UInt

var age: Int8 = 26 // 260 cant

let letter: Character = "a" // "asda" cant
let isSwiftCool = true
let avarage = 7.84 // infers Double


let firstName = "Gabriel"
let lastName = "Barth"

// String interpolation
let fullName = firstName + " " + lastName

// String concatenation
// let gabrielBio = firstName + " " + lastName + ", " + age + " anos" // wrong
let gabrielBio = "\(firstName) \(lastName), \(age) anos" // correct

// Tuple
// let address = "Rua dos Jardins, 500, 64003-010"

// simple
let address = ("Rua dos Jardins", 500, "64003-010")
print("Ele mora no número \(address.1)")

// better
let addressBetter: (street: String, number: Int, zipCode: String) = ("Rua dos Jardins", 500, "64003-010")
print("Ele mora no número \(addressBetter.number)")

// Tuple decomposition
let (name, number, _) = addressBetter
name
number

// Optional
var driverLicense: String? = nil

print(driverLicense)

//driverLicense = "ABC-123"
print(driverLicense)

// Unwrap (desembrulhar)

// simplifiead way
if let driverLicense {
    print(driverLicense)
} else {
    print("He doesnt have drivers license")
}

// non-simplified way
if let driverLicense2 = driverLicense {
    print(driverLicense2)
} else {
    print("He doesnt have drivers license")
}

// null coalescence operator (??)
let newDriverLicence = driverLicense ?? "another thing"
print(newDriverLicence)


let number1 = "12a"
let number2 = "25"
let number3 = "9"

// let newNumber = Int(number1) // let newNumber: Int?
let newNumber: Int = Int(number1) ??  Int(number2) ??  Int(number3) ?? 0 // now its Int

// Force unwrapp (JEITO VIDA LOKA)
// let anotherNumber = Int(number1)! // crash!! beacouse number1 is "12a", not "12"


// Collection: Array, Dictionary, Set
var shoppingList: [String] = ["Açúcar", "Leite", "Café"]
var emptyArray: [Int] = []

// adding
shoppingList.append("Sabão")
shoppingList += ["Uva", "Pera"]
if shoppingList.count > 1 {
    shoppingList.insert("Maçã", at: 1)
}

print(shoppingList)

// counting elements
shoppingList.count
shoppingList.isEmpty

// removing
let removedItem = shoppingList.remove(at: 3)
print(shoppingList)
print(removedItem)

// searching elements
if shoppingList.contains("Leite") {
    print("O leite está garantido!")
}
shoppingList.firstIndex(of: "Leite") // returns Int?
if let index = shoppingList.firstIndex(of: "Leite") { // validate if "Leite" exists
    print("O leite está na posição \(index) do array")
}

print(shoppingList[3])

// Dictionary
var emptyDictionaty: [String: String] = [:]

var states: [String: String] = [
    "SP": "São Paulo",
    "MS": "Mato Grosso do Sul",
    "RJ": "Rio de Janeiro",
    "GO": "Goiás"
]

states.count
states.isEmpty

print(states["SP"]) // optional -> String?

if let saoPaulo = states["SP"] { // validate if sp exists
    print(saoPaulo)
}

states["XX"] // returns nil

// adding
states["PI"] = "Piauí"
states // hsa PI now

// removing
states["PI"] = nil
states

// update
states["RJ"] = "Rio de Janeiro novo"
print(states)


// Set
var movies: Set<String> = ["The Shawshank Redemption", "The Godfather", "The Godfather: Part II", "The Dark Knight", "12 Angry Men", "Spiderman"]
var movies2: Set<String> = ["Spiderman", "Ironman", "Thor", "Hulk", "Black Panther"]

movies.count
movies.isEmpty

movies.insert("Another Movier")
movies.insert("Another Movier") // not inserted because set allow only unique elements

let (inserted, _) = movies.insert("Another Movier")
if inserted {
    print("Movie inserted!")
} else {
    print("Movie already exists!")
}

movies.contains("The Godfather")
movies.remove("The Godfather")
print(movies)


let favoriteMovies = movies.intersection(movies2)
print(favoriteMovies)

let allMovies = movies.union(movies2)
print(allMovies) // doesnt repeat

movies = movies.subtracting(movies2)
print(movies) // remove equals movies

// if else
var temperature = 19, climate = ""
if temperature <= 0 {
    climate = "very cold"
} else if temperature < 14 {
    climate = "cold"
} else if temperature < 24 {
    climate = "good"
} else {
    climate = "hot"
}
print(climate)

// Switch
switch temperature {
case 0...13:
    climate = "Too cold"
case 14...23:
    climate = "good"
default:
    climate = "hot"
}
print(climate)

var newLetter = "z", letterType = ""
switch newLetter.lowercased() {
    case "a", "e", "i", "o", "u":
    letterType = "vowel"
default:
    letterType = "consonant"
}

let speed = 95.0
switch speed {
case 0.0..<20.0:
    print("first gear")
case 20.0..<40.0:
    print("second gear")
default:
    print("another gear.. ")
}


// While
var count = 1
while count <= 5 {
    print("aa")
    count += 1
}

// For in
// for (int i = 0; i <= 10; i++) { print(i) } // doestn exist on swift

for number in 1...10 {
    print(number)
}

for item in shoppingList {
    print(item)
}

for (sigla, nome) in states { // dictionary
    print(sigla, nome)
}


var 🐶 = "Billy"
var 🐕‍🦺 = "Daisy"
var 🍌 = "banana"
print("O \(🐶) e a \(🐕‍🦺) adoram comer \(🍌)")

