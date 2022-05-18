import Foundation

enum Color {
    case red 
    case green
    case blue
}

enum Size {
    case small 
    case medium
    case large
    case yuge
}

class Product {
    var name: String
    var color: Color
    var size: Size

    init(_ name: String, color: Color, size: Size) {
        self.name = name
        self.color = color
        self.size = size
    }
}

// Specification
protocol Specification {
    associatedtype T
    func isSatisFied(_ item: T) -> Bool
}

protocol Filter {
    associatedtype T
    func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T]
        where Spec.T == T;
}

class ColorSpecification: Specification {
    typealias T = Product
    let color: Color

    init(_ color: Color) {
        self.color = color
    }

    func isSatisFied(_ item: Product) -> Bool {
        return item.color == self.color
    }
}
class SizeSpecification: Specification {
    typealias T = Product
    let size: Size

    init(_ size: Size) {
        self.size = size
    }

    func isSatisFied(_ item: Product) -> Bool {
        return item.size == self.size
    }
}

class AndSpecification<T, SpecA: Specification, SpecB: Specification>: Specification where SpecA.T == SpecB.T, T == SpecB.T {
    let first: SpecA
    let second: SpecB
    init(_ first: SpecA,_ second: SpecB) {
        self.first = first
        self.second = second
    }

    func isSatisFied(_ item: T) -> Bool {
        return first.isSatisFied(item) && second.isSatisFied(item)
    }

}


class BetterFilter: Filter {
    typealias T = Product

    func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T] where Spec.T == T {
        return items.filter({ spec.isSatisFied($0) })        
    }
}

func main() {
    let apple = Product.init("Apple", color: .green, size: .small)
    let tree = Product.init("Tree", color: .green, size: .large)
    let house = Product.init("house", color: .blue, size: .large)

    let products = [apple, tree, house]

    let bf = BetterFilter()
    let resualt = bf.filter(products, ColorSpecification(.green))

    for item in resualt {
        print(item.name)
    }

    for item in bf.filter(products, AndSpecification(ColorSpecification.init(.green), SizeSpecification(.large))) {
        print(item.name)
    }


}

main()