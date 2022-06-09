import Foundation

protocol Copying {
    init(copyFrom other: Self)
}

class Address: CustomStringConvertible, Copying {
    var streetAddress: String
    var city: String

    init(_ streetAddress: String, _ city: String) {
        self.streetAddress = streetAddress
        self.city = city
    }

    required init(copyFrom other: Address) {
        streetAddress = other.streetAddress
        city = other.city
    }

    var description: String {
        return "\(streetAddress), \(city)"
    }
}

class Employee: CustomStringConvertible, Copying {
    var name: String
    var address: Address

    init(_ name: String, _ address: Address) {
        self.name = name
        self.address = address
    }

    required init(copyFrom other: Employee) {
        name = other.name
        address = Address.init(copyFrom: other.address)
    }

    var description: String {
        return "My name is \(name) and I live at \(address)"
    }
}

func main() {
    let jhon = Employee("Jhon", Address("123 London Road", "Lodon"))

    var chris = Employee.init(copyFrom: jhon)
    chris.name = "chris"
    print(jhon.description)
    print(chris.description)
}

main()